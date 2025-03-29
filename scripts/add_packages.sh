#!/bin/bash

# {{ Add luci-app-diskman
(cd friendlywrt && {
    mkdir -p package/luci-app-diskman
    wget https://raw.githubusercontent.com/lisaac/luci-app-diskman/master/applications/luci-app-diskman/Makefile -O package/luci-app-diskman/Makefile
})
cat >> configs/rockchip/01-nanopi <<EOL
CONFIG_PACKAGE_luci-app-diskman=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_btrfs_progs=y
CONFIG_PACKAGE_luci-app-diskman_INCLUDE_lsblk=y
CONFIG_PACKAGE_smartmontools=y
EOL
# }}

# {{ Add luci-theme-argon
# (cd friendlywrt/package && {
#     [ -d luci-theme-argon ] && rm -rf luci-theme-argon
#     git clone https://github.com/jerrykuku/luci-theme-argon.git --depth 1 -b master
# })
# echo "CONFIG_PACKAGE_luci-theme-argon=y" >> configs/rockchip/01-nanopi
# sed -i -e 's/function init_theme/function old_init_theme/g' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
# cat > /tmp/appendtext.txt <<EOL
# function init_theme() {
#     if uci get luci.themes.Argon >/dev/null 2>&1; then
#         uci set luci.main.mediaurlbase="/luci-static/argon"
#         uci commit luci
#     fi
# }
# EOL
sed -i -e '/boardname=/r /tmp/appendtext.txt' friendlywrt/target/linux/rockchip/armv8/base-files/root/setup.sh
# }}

# 01-nanopi
sed -i -e '/CONFIG_ARIA2_BITTORRENT=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_ARIA2_NOXML=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_ARIA2_OPENSSL=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_ARIA2_WEBSOCKET=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_aria2=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_collectd-mod-iwinfo=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_collectd-mod-wireless=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_hd-idle=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_hostapd-common=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_iw=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_iwinfo=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_kmod-cfg80211=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_libiwinfo=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_libiwinfo-data=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_libiwinfo-lua=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-app-aria2=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-app-hd-idle=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-app-minidlna=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-app-samba4=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-app-smartdns=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-app-upnp=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-theme-material=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_luci-theme-openwrt-2020=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_minidlna=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_miniupnpd=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_miniupnpd-nftables=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_rpcd-mod-iwinfo=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_samba4-libs=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_samba4-server=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_smartdns=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_usb-modeswitch-official=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_vsftpd=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_wireless-regdb=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_wpad-mini=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_PACKAGE_wsdd2=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_SAMBA4_SERVER_AVAHI=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_SAMBA4_SERVER_NETBIOS=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_SAMBA4_SERVER_VFS=y/d' configs/rockchip/01-nanopi
sed -i -e '/CONFIG_SAMBA4_SERVER_WSDD2=y/d' configs/rockchip/01-nanopi
sed -i -e 's/vim-full/vim-fuller/' configs/rockchip/01-nanopi

# 02-luci_lang
echo "CONFIG_LUCI_LANG_en=y" > configs/rockchip/02-luci_lang

# 03-custom

# 04-utils
cat >> configs/rockchip/04-utils <<EOL
# custom
CONFIG_PACKAGE_luci-proto-wireguard=y
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_ddns-scripts-cloudflare=y
CONFIG_PACKAGE_bind-host=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_tcpdump=y
CONFIG_PACKAGE_banip=y
CONFIG_PACKAGE_luci-app-banip=y
CONFIG_PACKAGE_nvme-cli=y
CONFIG_PACKAGE_tinyproxy=y
CONFIG_PACKAGE_luci-app-tinyproxy=y
CONFIG_PACKAGE_collectd-mod-dns=y
CONFIG_PACKAGE_luci-app-cloudflared=y
EOL

# 05-wifi
sed -i -e '/firmware/d' configs/rockchip/05-wifi

# 06-docker
cat >> configs/rockchip-docker/06-docker <<EOL
# custom
CONFIG_PACKAGE_docker-compose=y
EOL

# distfeeds
echo "distfeeds: $(pwd)"
echo "$(cat device/common/distfeeds/install.sh)"
sed -i -e '8,12d' device/common/distfeeds/install.sh
sed -i -e 's|mirrors.ustc.edu.cn\/openwrt|downloads.openwrt.org|g' device/common/distfeeds/install.sh
echo "$(cat device/common/distfeeds/install.sh)"

# emmc-tools
sed -i -e '10,13d' device/common/emmc-tools/install.sh
rm -f device/common/emmc-tools/luci-i18n-emmc-tools-zh-cn.ipk
