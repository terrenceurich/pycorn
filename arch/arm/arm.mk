CFLAGS += -fno-dwarf2-cfi-asm
PYCFLAGS += -fno-dwarf2-cfi-asm
EXTMODULES += $(ARCHPATH)/metal/ext/$( _bootstrapmodule.o _metalcpu_coproc.o _metalcpumodule.o)
FREEZEDIRS += $(ARCHPATH)/metal/frozen
INITRDDIRS += $(ARCHPATH)/metal/initrd
MKIMAGE := python $(ARCHPATH)/mkimage.py
MKIMAGEFLAGS := -A arm -O linux
KERNELMKIMAGE := $(MKIMAGEFLAGS) -T kernel
INITRDMKIMAGE := $(MKIMAGEFLAGS) -T ramdisk

ifndef USE_BINARIES
ifdef OBJECTS
%.uimage: %.bin
	$(MKIMAGE) -C none $(KERNELMKIMAGE) -n $(basename $(input)) -d $(input) $(output)
endif
endif

ifdef RAMDISK
$(RAMDISK).uimage: $(RAMDISK)
	$(MKIMAGE) -C none $(INITRDMKIMAGE) -n $(input) -d $(input) $(output)
endif
