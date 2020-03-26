################################################################################
#
# ethoslip_tun
#
################################################################################

ETHOSLIP_TUN_VERSION = v0.4
ETHOSLIP_TUN_SITE = $(call github,hxdyxd,ethoslip_tun,$(ETHOSLIP_TUN_VERSION))

define ETHOSLIP_TUN_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef


define ETHOSLIP_TUN_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/ethoslip_tun $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 0755 $(@D)/S39ethoslip_tun $(TARGET_DIR)/usr/bin
endef


$(eval $(generic-package))
