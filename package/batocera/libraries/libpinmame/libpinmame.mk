################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Feb 6, 2025
LIBPINMAME_VERSION = ecd032e55481b261cce4820b53fd28fe478c70b4
LIBPINMAME_SITE = $(call github,vpinball,pinmame,$(LIBPINMAME_VERSION))
LIBPINMAME_LICENSE = BSD-3-Clause
LIBPINMAME_LICENSE_FILES = LICENSE
LIBPINMAME_DEPENDENCIES = zlib
LIBPINMAME_SUPPORTS_IN_SOURCE_BUILD = NO

define LIBPINMAME_RENAME_CMAKE
    cp $(@D)/cmake/libpinmame/CMakeLists_linux-x64.txt $(@D)/CMakeLists.txt
    rm $(@D)/makefile
endef

LIBPINMAME_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define LIBPINMAME_INSTALL_TARGET_CMDS
    # staging files
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/libpinmame.so.3.6 \
        $(STAGING_DIR)/usr/lib
    cp $(@D)/src/libpinmame/libpinmame.h $(STAGING_DIR)/usr/include
    # copy to target
    $(INSTALL) -D -m 0755 $(@D)/buildroot-build/libpinmame.so.3.6 \
        $(TARGET_DIR)/usr/lib
endef

LIBPINMAME_PRE_CONFIGURE_HOOKS += LIBPINMAME_RENAME_CMAKE

$(eval $(cmake-package))
