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

# Verhindert den Download-Fehler im SDK, da der Code lokal im Repo liegt
PKG_SOURCE_PROTO:=none

# Kennzeichnet das Paket als architekturunabhängig (funktioniert auf x86, Kirkwood, etc.)
PKGARCH:=all

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-vsftpd-wt
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for VSFTPD (Wi-Tech Edition)
	DEPENDS:=+luci-base +vsftpd
endef

define Package/luci-app-vsftpd-wt/description
	Modernisiertes LuCI-Modul für VSFTPD, optimiert für OpenWrt 25.12 
	durch Wi-Tech. Bietet eine grafische Oberfläche zur Verwaltung 
	des FTP-Servers.
endef

define Package/luci-app-vsftpd-wt/conffiles
/etc/config/vsftpd
endef

# Da es sich um eine reine LuCI-App handelt, ist keine Kompilierung nötig
define Build/Prepare
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

	# Menü-Konfiguration
	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/luci-app-vsftpd-wt.json $(1)/usr/share/luci/menu.d/
	
	# Zugriffsrechte (ACL)
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/luci-app-vsftpd-wt.json $(1)/usr/share/rpcd/acl.d/
	
	# JavaScript Views (Das UI für den Browser)
	$(INSTALL_DATA) ./root/usr/share/luci/resources/view/vsftpd-wt/*.js $(1)/usr/share/luci/resources/view/vsftpd-wt/
	
	# UCI Konfigurationsdatei
	$(INSTALL_CONF) ./root/etc/config/vsftpd $(1)/etc/config/vsftpd
	
	# Init-Skript (muss ausführbar sein -> INSTALL_BIN)
	$(INSTALL_BIN) ./root/etc/init.d/vsftpd $(1)/etc/init.d/vsftpd
endef

$(eval $(call BuildPackage,luci-app-vsftpd-wt))
