#ifndef __XFFT_DEF_H__
#define __XFFT_DEF_H__

#include <stdint.h>

extern int xfft_init(void);
extern int xfft_set_config(uint32_t n,  uint8_t fwd_inv);
extern void xfft_deinit(void);

#endif /* !__XFFT_DEF_H__ */
