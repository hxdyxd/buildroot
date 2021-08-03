################################################################################
#
# armemulator
#
################################################################################

ARMEMULATOR_VERSION = 953ba54cd5abf9dd471d555c7764a68b005470fc
ARMEMULATOR_SITE = https://github.com/hxdyxd/arm_emulator.git
ARMEMULATOR_SITE_METHOD=git
ARMEMULATOR_GIT_SUBMODULES = YES
ARMEMULATOR_DEPENDENCIES = host-pkgconf libglib2

define ARMEMULATOR_BUILD_CMDS
    $(TARGET_CONFIGURE_OPTS) $(MAKE) CROSS_COMPILE=$(TARGET_CROSS) \
		GIT_TAGS=$(ARMEMULATOR_VERSION) -C $(@D) all
endef


define ARMEMULATOR_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/armemulator $(TARGET_DIR)/usr/bin/armemulator
    $(INSTALL) -D -m 0755 $(@D)/S39slip $(TARGET_DIR)/etc/init.d/S39slip
endef


$(eval $(generic-package))
