#ifndef __XFFT_DMA_BUF_DEF_H__
#define __XFFT_DMA_BUF_DEF_H__

#include <stdint.h>

typedef struct
{
  uint32_t*     tx_buf;
  uint32_t*     rx_buf;
  uint32_t      tx_buf_size;        // XXX in bytes, not in uint32 !!!
  uint32_t      rx_buf_size;        // XXX in bytes, not in uint32 !!!
  uint32_t      tx_phys_addr;
  uint32_t      rx_phys_addr;
} xfft_dma_buf_t;

extern int xfft_dma_buf_init(void);
extern void xfft_dma_buf_get_info(xfft_dma_buf_t* info);
extern void xfft_dma_buf_deinit(void);

#endif /* !__XFFT_DMA_BUF_DEF_H__ */
