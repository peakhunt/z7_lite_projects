#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <getopt.h>
#include "xfft.h"
#include "xfft_dma_buf.h"
#include "dma.h"
#include "debug.h"

// 4096 works. there is a problem with configuring xFFT via FIFO
#define NUM_FFT_POINTS      1024

static xfft_dma_buf_t _dma_buf_info;
static int            _fft_size = NUM_FFT_POINTS;

static void
get_dma_buf_info(void)
{
  xfft_dma_buf_get_info(&_dma_buf_info);
  PDEBUG("====== FFT DMA Buffer Info ======\n");
  PDEBUG("TX Buffer Physical Address: %08x\n", _dma_buf_info.tx_phys_addr);
  PDEBUG("TX Buffer SIZE: %08x\n", _dma_buf_info.tx_buf_size);
  PDEBUG("RX Buffer Physical Address: %08x\n", _dma_buf_info.rx_phys_addr);
  PDEBUG("RX Buffer SIZE: %08x\n", _dma_buf_info.rx_buf_size);
}

static void
init_fft_buffer_data(void)
{
  // FIXME init FFT sample data
}

static void
print_fft_result(void)
{
  // FIXME print FFT result
}

static void
print_version(void)
{
  printf("xfft version 0.1\n");
  exit(0);
}

static void
print_help(void)
{
  printf("\
 -v --version     Print program version\n\
 -h --help        Print help message\n\
 -d --debug       Enable debug\n\
 -s --size        Set FFT size. 64/128/256/512/1024/2048/4096\n\
\n");
  exit(0);
}

static void
handle_fft_options(int argc, char** argv)
{
  int iarg = 0,
      index;
  const static struct option longopts[] = 
  {
    { "version",      no_argument,        0,    'v' },
    { "help",         no_argument,        0,    'h' },
    { "debug",        no_argument,        0,    'd' },
    { "size",         required_argument,  0,    's' },
    {0,0,0,0},
  };

  while(iarg != -1)
  {
    iarg = getopt_long(argc, argv, ":vhds:", longopts, &index);
    switch (iarg)
    {
      case 'v':
        print_version();
        break;

      case 'h':
        print_help();
        break;

      case 'd':
        // FIXME
        break;

      case 's':
        _fft_size = atoi(optarg);
        break;

      case ':':   // missing option argument
        printf("missing option argument\n");
        print_help();
        break;
    }
  }
}

int
main(int argc, char** argv)
{
  uint32_t count = 0;
  handle_fft_options(argc, argv);

  printf("xFFT fft size = %d\n", _fft_size);

  if(xfft_init() != 0)
  {
    goto xfft_init_failed;
  }

  if(xfft_dma_buf_init() != 0)
  {
    goto xfft_dma_buf_init_failed;
  }

  if(dma_init() != 0)
  {
    goto dma_init_failed;
  }

  get_dma_buf_info();

  if(xfft_set_config(_fft_size, 1) != 0)
  {
    goto xfft_config_failed;
  }

  init_fft_buffer_data();

  // complex data. real: 4 byes, imaginary: 4 bytes
  while(1)
  {
    printf("main: dma_do_rtx_transaction begin\n");

    if(xfft_set_config(_fft_size, 1) != 0)
    {
      goto xfft_config_failed;
    }

    dma_do_rtx_transaction(
        _dma_buf_info.tx_phys_addr,           // tx physical address
        _dma_buf_info.rx_phys_addr,           // rx physical address
        _fft_size * 8,                        // tx num bytes
        _fft_size * 8);                       // rx num bytes
    count += 1;
    printf("main: dma_do_rtx_transaction end %d\n", count);
    //usleep(10000);    // 10 msec
  }

  print_fft_result();

  dma_deinit();
  xfft_dma_buf_deinit();
  xfft_deinit();
  return 0;

xfft_config_failed:
  dma_deinit();

dma_init_failed:
  xfft_dma_buf_deinit();

xfft_dma_buf_init_failed:
  xfft_deinit();

xfft_init_failed:
  return -1;
}
