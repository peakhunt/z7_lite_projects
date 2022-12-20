#ifndef __XDEBUG_DEF_H__
#define __XDEBUG_DEF_H__

#include <stdio.h>

#if 0
#define PDEBUG(fmt, ...)      printf(fmt, ##__VA_ARGS__)
#else
#define PDEBUG(fmt, ...)
#endif

#endif /* !__XDEBUG_DEF_H__ */
