#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "xfft.h"
#include "debug.h"

/*
   xFFT configuration interface is connected to Zynq7 via AXI-Stream-Fifo.
*/
#define AXI_FIFO_UIO_DEVICE             "/dev/uio1"
#define XFFT_CONFIG_SIZE                (64 * 1024)

#define SCALE_SCH_POWER_4               ((uint32_t)(0xaaa) << 9)
#define SCALE_SCH_NOT_POWER_4           ((uint32_t)(0x666) << 9)

typedef struct
{
  uint32_t        num_points;
  uint32_t        scale_sch;
  uint8_t         transform_size;
} fft_size_option_t;

typedef struct
{
  volatile uint32_t      isr;
  volatile uint32_t      ier;
  volatile uint32_t      tdfr;
  volatile uint32_t      tdfv;
  volatile uint32_t      tdfd;
  volatile uint32_t      tlr;
  volatile uint32_t      rdfr;
  volatile uint32_t      rdfo;
  volatile uint32_t      rdfd;
  volatile uint32_t      rlr;
  volatile uint32_t      srr;
} axi_fifo_reg_t;

static int                        _fd_uio   = -1;
static volatile axi_fifo_reg_t*   _axi_fifo_ptr = MAP_FAILED;
static fft_size_option_t          _fft_option_table[] =
{
  { 64,       SCALE_SCH_POWER_4,        6,      },
  { 128,      SCALE_SCH_NOT_POWER_4,    7,      },
  { 256,      SCALE_SCH_NOT_POWER_4,    8,      },
  { 512,      SCALE_SCH_NOT_POWER_4,    9,      },
  { 1024,     SCALE_SCH_POWER_4,        10,     },
  { 2048,     SCALE_SCH_NOT_POWER_4,    11,     },
  { 4096,     SCALE_SCH_POWER_4,        12,     },
};

static inline void
reenable_fifo_interrupt_uio(void)
{
  int ret;
  uint32_t reenable = 0x00000001;

  PDEBUG("xfft: reenabling interrupt\n");
  // reenable interrupt
  ret = write(_fd_uio,(void *)&reenable,sizeof(uint32_t));
  (void)ret;
  PDEBUG("xfft: reenabling interrupt done %d\n", ret);
}

static inline fft_size_option_t*
get_fft_option(uint32_t n)
{
  for(int i = 0; i < sizeof(_fft_option_table)/sizeof(fft_size_option_t); i++)
  {
    if(n == _fft_option_table[i].num_points)
    {
      return &_fft_option_table[i];
    }
  }
  return NULL;
}

static void
dump_fifo_regs(void)
{
  PDEBUG("====== regs ======\n");
  PDEBUG("isr : %08x\n", _axi_fifo_ptr->isr);
  PDEBUG("ier : %08x\n", _axi_fifo_ptr->ier);
  PDEBUG("tdfv : %08x\n", _axi_fifo_ptr->tdfv);
}

int
xfft_init(void)
{
  _fd_uio = open(AXI_FIFO_UIO_DEVICE, O_RDWR);
  if (_fd_uio < 0)
  {
    PDEBUG("xfft: failed to open %s, %d\n", AXI_FIFO_UIO_DEVICE, _fd_uio);
    return -1;
  }

  _axi_fifo_ptr = mmap(NULL, XFFT_CONFIG_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, _fd_uio, 0);
  if (_axi_fifo_ptr == MAP_FAILED)
  {
    PDEBUG("xfft: mmap failed\n");
    return -1;
  }

  // reset tx fifo
  _axi_fifo_ptr->tdfr = 0x000000a5;

  // clear all pending interrupts
  _axi_fifo_ptr->isr =  0xffffffff;

  // enable only TCE interrupts
  _axi_fifo_ptr->ier = (1 << 27);

  // enable UIO interrupt
  reenable_fifo_interrupt_uio();

  dump_fifo_regs();
  PDEBUG("xfft: initialize complete\n");
  return 0;
}

int
xfft_set_config(uint32_t n, uint8_t fwd_inv)
{
  uint32_t  cfg;
  int       ret;
  uint32_t  pending;
  fft_size_option_t*    option;

  option = get_fft_option(n);
  if( option == NULL)
  {
    PDEBUG("xfft: invalid fft size %d\n", n);
    return -1;
  }

#if 0
  // test
  _axi_fifo_ptr->tdfr = 0x000000a5;
  _axi_fifo_ptr->isr =  0xffffffff;
  _axi_fifo_ptr->ier = (1 << 27);
  dump_fifo_regs();
  // end of test
#endif

  cfg = option->transform_size | (fwd_inv ? (1 << 8) : 0) | option->scale_sch;
  PDEBUG("xfft: setting config to %d,%x\n", cfg, cfg);

  _axi_fifo_ptr->tdfd = cfg;
  _axi_fifo_ptr->tlr = 4;

  PDEBUG("xfft: waiting for fifo tx complete\n");
  ret = read(_fd_uio, (void *)&pending, sizeof(uint32_t));

  // clear all pending interrupts
  _axi_fifo_ptr->isr =  0xffffffff;

  reenable_fifo_interrupt_uio();

  if (ret < 0)
  {
    PDEBUG("xfft: XXXXXXX waiting for fifo tx complete error XXXXXXXXXX %d\n", ret);
    return -1;
  }

  PDEBUG("xfft: waiting for fifo tx complete done\n");
  return 0;
}

void
xfft_deinit(void)
{
  if (_axi_fifo_ptr != MAP_FAILED)
  {
    munmap((void*)_axi_fifo_ptr, XFFT_CONFIG_SIZE);
    _axi_fifo_ptr = MAP_FAILED;
  }

  if(_fd_uio >= 0)
  {
    close(_fd_uio);
    _fd_uio = -1;
  }
  PDEBUG("xfft: deinitialize complete\n");
}
