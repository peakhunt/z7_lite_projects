#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "debug.h"
#include "xfft_dma_buf.h"

#define FFT_BUFFER_SIZE     (1024 * 64)

#define FFT_TX_BUF_DEVICE   "/dev/fft_tx_udma"
#define FFT_RX_BUF_DEVICE   "/dev/fft_rx_udma"

#define FFT_TX_BUF_PHYS_ADDRESS_FILE    "/sys/class/u-dma-buf/fft_tx_udma/phys_addr"
#define FFT_RX_BUF_PHYS_ADDRESS_FILE    "/sys/class/u-dma-buf/fft_rx_udma/phys_addr"

static int _fd_rx_buf = -1;
static int _fd_tx_buf = -1;

static uint32_t* _rx_buf_ptr = MAP_FAILED;
static uint32_t* _tx_buf_ptr = MAP_FAILED;

static uint32_t   _tx_buf_phys_addr,
                  _rx_buf_phys_addr;

static uint32_t
xfft_dma_read_phys_addr(const char* file)
{
  static char attr[1024];
  uint32_t    addr;
  int fd, ret;

  if((fd = open(file, O_RDONLY)) != -1)
  {
    ret = read(fd, attr, 1024);
    (void)ret;
    sscanf(attr, "%x", &addr);
    close(fd);
    return addr;
  }
  return 0;
}

int
xfft_dma_buf_init(void)
{
  if((_fd_tx_buf = open(FFT_TX_BUF_DEVICE, O_RDWR)) < 0)
  {
    PDEBUG("xfft_dma_buf: failed to open %s, %d\n", FFT_TX_BUF_DEVICE, _fd_tx_buf);
    return -1;
  }

  _tx_buf_ptr = mmap(NULL, FFT_BUFFER_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, _fd_tx_buf, 0);
  if (_tx_buf_ptr == MAP_FAILED)
  {
    PDEBUG("xfft_dma_buf: tx buffer mmap failed\n");
    return -1;
  }

  if((_fd_rx_buf = open(FFT_RX_BUF_DEVICE, O_RDWR)) < 0)
  {
    PDEBUG("xfft_dma_buf: failed to open %s, %d\n", FFT_RX_BUF_DEVICE, _fd_rx_buf);
    return -1;
  }

  _rx_buf_ptr = mmap(NULL, FFT_BUFFER_SIZE, PROT_READ|PROT_WRITE, MAP_SHARED, _fd_rx_buf, 0);
  if (_rx_buf_ptr == MAP_FAILED)
  {
    PDEBUG("xfft_dma_buf: rx buffer mmap failed\n");
    return -1;
  }
  
  _tx_buf_phys_addr = xfft_dma_read_phys_addr(FFT_TX_BUF_PHYS_ADDRESS_FILE);
  _rx_buf_phys_addr = xfft_dma_read_phys_addr(FFT_RX_BUF_PHYS_ADDRESS_FILE);

  PDEBUG("xfft_dma_buf: initialize complete\n");
  return 0;
}

void
xfft_dma_buf_get_info(xfft_dma_buf_t* info)
{
  info->tx_buf = _tx_buf_ptr;
  info->rx_buf = _rx_buf_ptr;
  info->tx_phys_addr = _tx_buf_phys_addr;
  info->rx_phys_addr = _rx_buf_phys_addr;
  info->tx_buf_size = info->rx_buf_size = FFT_BUFFER_SIZE;
}

void
xfft_dma_buf_deinit(void)
{
  if(_tx_buf_ptr != MAP_FAILED)
  {
    munmap((void*)_tx_buf_ptr, FFT_BUFFER_SIZE);
    _tx_buf_ptr = MAP_FAILED;
  }

  if(_rx_buf_ptr != MAP_FAILED)
  {
    munmap((void*)_rx_buf_ptr, FFT_BUFFER_SIZE);
    _rx_buf_ptr = MAP_FAILED;
  }

  if(_fd_tx_buf >= 0)
  {
    close(_fd_tx_buf);
    _fd_tx_buf = -1;
  }

  if(_fd_rx_buf >= 0)
  {
    close(_fd_rx_buf);
    _fd_rx_buf = -1;
  }
  PDEBUG("xfft_dma_buf: deinitialize complete\n");
}
