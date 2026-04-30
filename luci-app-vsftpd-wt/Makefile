#
# Copyright 2019-2020 Tano Systems
# Copyright 2026 Wi-Tech
#
# Licensed under Apache-2.0
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-vsftpd-wt
PKG_VERSION:=2.0.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Wi-Tech
PKG_LICENSE:=Apache-2.0

# Wichtig für lokale Repositories ohne externen Download
PKG_SOURCE_PROTO:=none
PKGARCH:=all

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-vsftpd-wt
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for VSFTPD (Wi-Tech Edition)
	DEPENDS:=+luci-base +vsftpd
	PKGARCH:=all
endef

define Package/luci-app-vsftpd-wt/description
	Modernisiertes LuCI-Modul für VSFTPD, optimiert für OpenWrt 25.12 
	durch Wi-Tech.
endef

define Package/luci-app-vsftpd-wt/conffiles
/etc/config/vsftpd
endef

# Bereitet das Build-Verzeichnis vor, damit das SDK nicht abbricht
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-vsftpd-wt/install
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DIR) $(1)/usr/share/luci/resources/view/vsftpd-wt
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d

	# Menü & ACL
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/luci/menu.d/luci-app-vsftpd-wt.json $(1)/usr/share/luci/menu.d/
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/rpcd/acl.d/luci-app-vsftpd-wt.json $(1)/usr/share/rpcd/acl.d/

	# JavaScript Views (Pfade basierend auf deiner neuen Struktur)
	# Falls die JS-Dateien in root/usr/share/... liegen:
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/luci/resources/view/vsftpd-wt/*.js $(1)/usr/share/luci/resources/view/vsftpd-wt/

	# Konfiguration & Init-Skript
	$(INSTALL_CONF) $(CURDIR)/root/etc/config/vsftpd $(1)/etc/config/vsftpd
	$(INSTALL_BIN) $(CURDIR)/root/etc/init.d/vsftpd $(1)/etc/init.d/vsftpd
endef

$(eval $(call BuildPackage,luci-app-vsftpd-wt))
