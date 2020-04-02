################################################################################
#
# armemulator
#
################################################################################

ARMEMULATOR_VERSION = v0.1
ARMEMULATOR_SITE = $(call github,hxdyxd,arm_emulator,$(ARMEMULATOR_VERSION))

define ARMEMULATOR_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) LD=$(TARGET_CC) -C $(@D) all
endef


define ARMEMULATOR_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/armemulator $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/S39slip $(TARGET_DIR)/etc/init.d
endef


$(eval $(generic-package))
