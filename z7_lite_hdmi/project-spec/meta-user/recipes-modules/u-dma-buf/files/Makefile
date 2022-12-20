obj-m := u-dma-buf.o u-dma-buf-mgr.o

MY_CFLAGS += -g -DDEBUG -DU_DMA_BUF_IN_KERNEL_FUNCTIONS=y
ccflags-y += ${MY_CFLAGS}

SRC := $(shell pwd)

all:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)

modules_install:
	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install

clean:
	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
	rm -f Module.markers Module.symvers modules.order
	rm -rf .tmp_versions Modules.symvers
