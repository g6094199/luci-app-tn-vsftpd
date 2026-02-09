#
# Copyright 2019-2020 Tano Systems
# Copyright 2026 g6094199
#
# MIT License.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-vsftpd
PKG_VERSION:=2.0
PKG_RELEASE:=20200423
LUCI_TITLE:=LuCI JS Support for vsftpd (or very secure FTP daemon)
MAINTAINER:=g6094199
LUCI_DESCRIPTION:=Interface for managing vsftpd in OpenWrt.
LUCI_DEPENDS:=+luci-base +vsftpd
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature