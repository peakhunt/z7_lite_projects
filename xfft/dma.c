#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <errno.h>
#include "dma.h"
#include "xaxidma.h"
#include "debug.h"

#define AXI_DMA_UIO_DEVICE          "/dev/uio0"
#define CONTROLLER_SIZE             (64*1024)

static XAxiDma_Config*      _axi_dma_cfg = NULL;
static XAxiDma              _axi_dma;
static int                  _fd_uio = -1;

static volatile uint32_t*   _axi_dma_ptr = MAP_FAILED;

static inline void
reenable_dma_interrupt_uio(void)
{
  int ret;
  uint32_t reenable = 0x00000001;

  PDEBUG("dma: reenabling interrupt\n");
  // reenable interrupt
  ret = write(_fd_uio,(void *)&reenable,sizeof(uint32_t));
  (void)ret;
  PDEBUG("dma: reenabling interrupt done %d\n", ret);
}

int
dma_init(void)
{
  int ret;

  _axi_dma_cfg = XAxiDma_LookupConfig(0);
  if (_axi_dma_cfg == NULL) 
  {
    PDEBUG("dma: no AXI DMA Config found\n");
    return -1;
  }

  _fd_uio = open(AXI_DMA_UIO_DEVICE, O_RDWR);
  if(_fd_uio < 0)
  {
    PDEBUG("dma: failed to open %s %d\n", AXI_DMA_UIO_DEVICE, _fd_uio);
    return -1;
  }

  _axi_dma_ptr   = mmap(NULL, CONTROLLER_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, _fd_uio, 0);
  if(_axi_dma_ptr == MAP_FAILED)
  {
    PDEBUG("dma: mmap to dma controller failed\n");
    return -1;
  }
  _axi_dma_cfg->BaseAddr = (uint32_t)_axi_dma_ptr;

  ret = XAxiDma_CfgInitialize(&_axi_dma, _axi_dma_cfg);
  if(ret != XST_SUCCESS)
  {
    PDEBUG("dma: XAxiDma_CfgInitialize failed %d\n", ret);
    return -1;
  }

  XAxiDma_IntrDisable(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
  XAxiDma_IntrDisable(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

  XAxiDma_IntrEnable(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
  XAxiDma_IntrEnable(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

  XAxiDma_IntrAckIrq(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
  XAxiDma_IntrAckIrq(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

  // reenable interrupt
  reenable_dma_interrupt_uio();

  //
  // XXX: FIXME
  //
  // the rest of DMA init
  //

  PDEBUG("dma: initialize complete\n");
  return 0;
}

void
dma_deinit(void)
{
  XAxiDma_IntrDisable(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
  XAxiDma_IntrDisable(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

  if(_axi_dma_ptr != MAP_FAILED)
  {
    munmap((void*)_axi_dma_ptr, CONTROLLER_SIZE);
    _axi_dma_ptr = MAP_FAILED;
  }

  if(_fd_uio >= 0)
  {
    close(_fd_uio);
  }
  PDEBUG("dma: deinitialize complete\n");
}

int
dma_do_rtx_transaction(uint32_t t_phys_addr, uint32_t r_phys_addr, uint32_t t_len, uint32_t r_len)
{
  int       ret;
  uint32_t  pending = 0,
            r_irq_status,
            t_irq_status;

  // reenable interrupt
  reenable_dma_interrupt_uio();

  // setup and initiate receive first
  PDEBUG("dma: dma_do_rtx_transaction initiating rx\n");
  ret = XAxiDma_SimpleTransfer(&_axi_dma, r_phys_addr, r_len, XAXIDMA_DEVICE_TO_DMA);
  if (ret != XST_SUCCESS)
  {
    PDEBUG("dma: dma_do_rtx_transaction rx XAxiDma_SimpleTransfer fXAXIDMA_DEVICE_TO_DMA failed. %d\n", ret);
    return -1;
  }
  PDEBUG("dma: dma_do_rtx_transaction initiating rx done\n");

  // setup and initiate tx
  PDEBUG("dma: dma_do_rtx_transaction initiating tx\n");
  ret = XAxiDma_SimpleTransfer(&_axi_dma, t_phys_addr, t_len, XAXIDMA_DMA_TO_DEVICE);
  if (ret != XST_SUCCESS)
  {
    PDEBUG("dma: dma_do_rtx_transaction tx XAxiDma_SimpleTransfer failed. %d\n", ret);
    return -1;
  }
  PDEBUG("dma: dma_do_rtx_transaction initiating tx done\n");

  // wait for complete
  PDEBUG("dma: dma_do_rtx_transaction waiting for complete begin\n");
  ret = read(_fd_uio, (void *)&pending, sizeof(uint32_t));
  PDEBUG("dma: dma_do_rtx_transaction waiting for complete end\n");
  PDEBUG("dma: dma_send_data Pending interrupts = %d status = %d errno = 0x%0X\n",pending, ret, errno);
  if (ret < 0)
  {
    PDEBUG("dma: dma_send_data error = %s\n",strerror(errno));
    return -1;
  }

  t_irq_status = XAxiDma_IntrGetIrq(&_axi_dma, XAXIDMA_DMA_TO_DEVICE);
  PDEBUG("dma: t_irq_status %d\n", t_irq_status);
  XAxiDma_IntrAckIrq(&_axi_dma, t_irq_status, XAXIDMA_DMA_TO_DEVICE);

  r_irq_status = XAxiDma_IntrGetIrq(&_axi_dma, XAXIDMA_DEVICE_TO_DMA);
  PDEBUG("dma: r_irq_status %d\n", r_irq_status);
  XAxiDma_IntrAckIrq(&_axi_dma, r_irq_status, XAXIDMA_DEVICE_TO_DMA);

  if((t_irq_status & XAXIDMA_IRQ_ERROR_MASK))
  {
    PDEBUG("dma: dma_tx_data, irq with error\n");

    PDEBUG("dma: dma_tx_data, resetting DMA\n");
    XAxiDma_Reset(&_axi_dma);
    while(!XAxiDma_ResetIsDone(&_axi_dma))
      ;
    PDEBUG("dma: dma_tx_data, resetting DMA done\n");
    return -1;
  }

  if((r_irq_status & XAXIDMA_IRQ_ERROR_MASK))
  {
    PDEBUG("dma: dma_tx_data, irq with error\n");

    PDEBUG("dma: dma_tx_data, resetting DMA\n");
    XAxiDma_Reset(&_axi_dma);
    while(!XAxiDma_ResetIsDone(&_axi_dma))
      ;
    PDEBUG("dma: dma_tx_data, resetting DMA done\n");
    return -1;
  }

  return 0;
}

int
dma_do_rtx_transaction_poll(uint32_t t_phys_addr, uint32_t r_phys_addr, uint32_t t_len, uint32_t r_len)
{
  int       ret;

  // setup and initiate receive first
  PDEBUG("dma: dma_do_rtx_transaction_poll initiating rx\n");
  ret = XAxiDma_SimpleTransfer(&_axi_dma, r_phys_addr, r_len, XAXIDMA_DEVICE_TO_DMA);
  if (ret != XST_SUCCESS)
  {
    PDEBUG("dma: dma_do_rtx_transaction_poll rx XAxiDma_SimpleTransfer fXAXIDMA_DEVICE_TO_DMA failed. %d\n", ret);
    return -1;
  }
  PDEBUG("dma: dma_do_rtx_transaction_poll initiating rx done\n");

  // setup and initiate tx
  PDEBUG("dma: dma_do_rtx_transaction_poll initiating tx\n");
  ret = XAxiDma_SimpleTransfer(&_axi_dma, t_phys_addr, t_len, XAXIDMA_DMA_TO_DEVICE);
  if (ret != XST_SUCCESS)
  {
    PDEBUG("dma: dma_do_rtx_transaction_poll tx XAxiDma_SimpleTransfer failed. %d\n", ret);
    return -1;
  }
  PDEBUG("dma: dma_do_rtx_transaction_poll initiating tx done\n");

  // wait for complete
  PDEBUG("dma: dma_do_rtx_transaction_poll waiting for dma to device complete begin\n");
  while (XAxiDma_Busy(&_axi_dma, XAXIDMA_DMA_TO_DEVICE));
  PDEBUG("dma: dma_do_rtx_transaction_poll waiting for device to dma complete begin\n");
  while (XAxiDma_Busy(&_axi_dma, XAXIDMA_DEVICE_TO_DMA));
  PDEBUG("dma: dma_do_rtx_transaction_poll waiting for complete end\n");

  XAxiDma_IntrAckIrq(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
  XAxiDma_IntrAckIrq(&_axi_dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
  return 0;
}
