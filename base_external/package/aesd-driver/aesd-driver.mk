
##############################################################
#
# AESD CHAR DRIVER
#
##############################################################

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_DRIVER_VERSION = 27332953883e66bdb7a803736170688b53eb0f86
AESD_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-ImmineoII.git
AESD_DRIVER_SITE_METHOD = git

# AESD_DRIVER_LICENSE = Dual BSD/GPL
# AESD_DRIVER_LICENSE_FILES = LICENSE

AESD_DRIVER_MODULE_SUBDIRS = aesd-char-driver
AESD_DRIVER_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH)


define AESD_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/modules-helpers/
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/modules-helpers/aesdchar_load
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/modules-helpers/aesdchar_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
