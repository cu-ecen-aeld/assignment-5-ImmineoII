
##############################################################
#
# LDD
#
##############################################################

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_VERSION = 1325506db6f940835cc3a720794c95cd56a0e866
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-ImmineoII.git
LDD_SITE_METHOD = git

# LDD_LICENSE = Dual BSD/GPL
# LDD_LICENSE_FILES = LICENSE

LDD_MODULE_SUBDIRS = scull misc-modules
LDD_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH)


define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/modules-helpers/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/modules-helpers/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/modules-helpers/scull_unload
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/modules-helpers/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/modules-helpers/module_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
