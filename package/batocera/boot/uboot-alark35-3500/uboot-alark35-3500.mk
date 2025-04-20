################################################################################
#
# uboot files for HardKernel ODROID M1
#
################################################################################

UBOOT_ALARK35_3500_VERSION = 1.0
UBOOT_ALARK35_3500_SOURCE =

define UBOOT_ALARK35_3500_BUILD_CMDS
endef

define UBOOT_ALARK35_3500_INSTALL_TARGET_CMDS
	mkdir -p $(BINARIES_DIR)/uboot-alark35-3500
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/boot/uboot-alark35-3500/idbloader.img $(BINARIES_DIR)/uboot-alark35-3500/idbloader.img
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/boot/uboot-alark35-3500/u-boot.itb $(BINARIES_DIR)/uboot-alark35-3500/u-boot.itb
endef

$(eval $(generic-package))
