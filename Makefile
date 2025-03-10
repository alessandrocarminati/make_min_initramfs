BINARIES_DIR := binaries
ROOTFS_DIR := rootfs
BUILDS_DIR := builds

TARGETS := $(patsubst $(BINARIES_DIR)/%-busybox,%, $(wildcard $(BINARIES_DIR)/*-busybox))

ifeq (,$(filter $(MAKECMDGOALS),$(TARGETS)))
    ifneq ($(MAKECMDGOALS),)
        $(error Unknown target "$(MAKECMDGOALS)". Available targets: $(TARGETS))
    endif
endif

$(TARGETS):
	cd $(ROOTFS_DIR) && \
	cp ../$(BINARIES_DIR)/$@-busybox bin/busybox && \
	find . -print0 | cpio --null -o --format=newc > ../$(BUILDS_DIR)/$@-initramfs.cpio

.PHONY: $(TARGETS)
