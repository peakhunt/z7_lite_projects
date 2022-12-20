#ifndef __DMA_DEF_H__
#define __DMA_DEF_H__

#include <stdint.h>

extern int dma_init(void);
extern void dma_deinit(void);
extern int dma_do_rtx_transaction(uint32_t t_phys_addr, uint32_t r_phys_addr, uint32_t t_len, uint32_t r_len);
extern int dma_do_rtx_transaction_poll(uint32_t t_phys_addr, uint32_t r_phys_addr, uint32_t t_len, uint32_t r_len);

#endif /* !__XDMA_DEF_H__ */
