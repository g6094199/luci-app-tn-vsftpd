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

PKG_SOURCE_PROTO:=none

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
	Modernisiertes LuCI-Modul für VSFTPD. Nutzt die originale 
	vsftpd-Konfiguration über ein Backup-System.
endef

define Package/luci-app-vsftpd-wt/conffiles
/etc/config/vsftpd
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-vsftpd-wt/install
	# Erstellt die Basis-Verzeichnisse auf dem Router
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/vsftpd-wt
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DIR) $(1)/etc/config

	# Deine Config als .wt installieren, um APK-Konflikte zu vermeiden
	$(INSTALL_CONF) ./root/etc/config/vsftpd $(1)/etc/config/vsftpd.wt

	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/luci-app-vsftpd-wt.json $(1)/usr/share/luci/menu.d/
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/luci-app-vsftpd-wt.json $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DATA) ./root/www/luci-static/resources/view/vsftpd-wt/*.js $(1)/www/luci-static/resources/view/vsftpd-wt/
endef

define Package/luci-app-vsftpd-wt/postinst
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	# 1. Original-Config sichern
	if [ -f "/etc/config/vsftpd" ] && [ ! -f "/etc/config/vsftpd.bak" ]; then
		mv /etc/config/vsftpd /etc/config/vsftpd.bak
	fi
	# 2. WT-Config an die offizielle Stelle kopieren
	# Achte darauf, dass die Datei im Repo unter root/etc/config/vsftpd.wt liegt
	cp /etc/config/vsftpd.wt /etc/config/vsftpd
	# 3. Dienst neu starten
	/etc/init.d/vsftpd restart
fi
exit 0
endef

define Package/luci-app-vsftpd-wt/prerm
#!/bin/sh
if [ -z "$${IPKG_INSTROOT}" ]; then
	# Originalzustand wiederherstellen
	if [ -f "/etc/config/vsftpd.bak" ]; then
		mv /etc/config/vsftpd.bak /etc/config/vsftpd
	else
		rm -f /etc/config/vsftpd
	fi
	/etc/init.d/vsftpd restart
fi
exit 0
endef

$(eval $(call BuildPackage,luci-app-vsftpd-wt))
