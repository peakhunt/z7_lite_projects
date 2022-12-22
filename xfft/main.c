#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <getopt.h>
#include <math.h>
#include <signal.h>
#include "xfft.h"
#include "xfft_dma_buf.h"
#include "dma.h"
#include "debug.h"

// 4096 works. there is a problem with configuring xFFT via FIFO
#define NUM_FFT_POINTS      1024

static xfft_dma_buf_t _dma_buf_info;
static int            _fft_size = NUM_FFT_POINTS;

static void
block_signals(void)
{
  sigset_t mask;

  sigfillset(&mask);
  sigprocmask(SIG_SETMASK, &mask, NULL);
}

/*
static void
unblock_signals(void)
{
  sigset_t mask;

  sigemptyset(&mask);
  sigprocmask(SIG_SETMASK, &mask, NULL);
}
*/

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
print_fft_buffer(const char* title, float* buf)
{
  int       idx,
            n = 0;
  volatile float* vbuf = (volatile float*)buf;
  float     f_r, f_i;

  printf("%s", title);

  for (idx = 0; idx < _fft_size; idx += 4)
  {
    f_r = vbuf[n++];
    f_i = vbuf[n++];

    printf("%04d: [%9.4f %9.4f] ", idx, f_r, f_i);

    f_r = buf[n++];
    f_i = buf[n++];
    printf("%04d: [%9.4f %9.4f] ", idx + 1, f_r, f_i);

    f_r = buf[n++];
    f_i = buf[n++];
    printf("%04d: [%9.4f %9.4f] ", idx + 2, f_r, f_i);

    f_r = buf[n++];
    f_i = buf[n++];
    printf("%04d: [%9.4f %9.4f]\n", idx + 3, f_r, f_i);
  }
}

static void
init_fft_buffer_data(void)
{
#define FFT_TEST_FFT_SIZE           (_fft_size)
#define FFT_TEST_BIN_SIZE           2.0
#define FFT_TEST_FREQ               20.0
#define FFT_TEST_FFT_AMP            8.0
#define FFT_TEST_FFT_SCALE          ( 2.0 / FFT_TEST_FFT_SIZE )
#define FFT_TEST_SAMPLE_RATE        ( FFT_TEST_FFT_SIZE * FFT_TEST_BIN_SIZE )

  int       idx,
            n = 0;
  float     tmp_f0;
  float*    in_buf = (float*)_dma_buf_info.tx_buf;

  for (idx = 0; idx < _fft_size; idx++)
  {
    tmp_f0 = FFT_TEST_FREQ;
    tmp_f0 *= (2 * M_PI);
    tmp_f0 *= ( (float)idx / (float)( FFT_TEST_SAMPLE_RATE ) );
    tmp_f0 = FFT_TEST_FFT_AMP * (float)cosf( tmp_f0 );

    // complex FFT
    in_buf[n++] = tmp_f0;     // real part
    in_buf[n++] = 0;          // complex part
  }
  print_fft_buffer("=== FFT data ===\n", in_buf);
}

static void
print_fft_result(void)
{
  float*    out_buf = (float*)_dma_buf_info.rx_buf;

  print_fft_buffer("=== FFT result ===\n", out_buf);
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
  handle_fft_options(argc, argv);

  //
  // terminating without proper exit
  // seems to cause some trouble in IP later
  //
  block_signals();

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
  dma_do_rtx_transaction(
      _dma_buf_info.tx_phys_addr,           // tx physical address
      _dma_buf_info.rx_phys_addr,           // rx physical address
      _fft_size * 8,                        // tx num bytes
      _fft_size * 8);                       // rx num bytes

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
