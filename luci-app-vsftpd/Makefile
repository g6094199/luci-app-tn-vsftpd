#
# Copyright 2019-2020 Tano Systems
# Copyright 2026 g6094199
#
# Apache-2.0
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-tn-vsftpd
PKG_VERSION:=2.0.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Dein Name <deine@email.de>
PKG_LICENSE:=Apache-2.0
PKGARCH:=all

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-tn-vsftpd
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for VSFTPD (Tano Systems)
	DEPENDS:=+luci-base +vsftpd
endef

define Package/luci-app-tn-vsftpd/description
	Modernisiertes LuCI-Modul für VSFTPD, optimiert für OpenWrt ab 25.12.
endef

define Package/luci-app-tn-vsftpd/conffiles
/etc/config/vsftpd
endef

define Package/luci-app-tn-vsftpd/install
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DIR) $(1)/usr/share/luci/resources/view/tn-vsftpd
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
    $(INSTALL_DATA) ./root/usr/share/luci/menu.d/luci-app-tn-vsftpd.json $(1)/usr/share/luci/menu.d/
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/luci-app-tn-vsftpd.json $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DATA) ./root/www/luci-static/resources/view/tn-vsftpd/*.js $(1)/usr/share/luci/resources/view/tn-vsftpd/
	$(INSTALL_CONF) ./root/etc/config/vsftpd $(1)/etc/config/vsftpd
	$(INSTALL_BIN) ./root/etc/init.d/vsftpd $(1)/etc/init.d/vsftpd
endef

$(eval $(call BuildPackage,luci-app-tn-vsftpd))
