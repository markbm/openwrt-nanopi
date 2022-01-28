#!/bin/bash
#========================================================================================================================
# https://github.com/markbm/compile-openwrt
# Description: Automatically Build OpenWrt for raspberry pi 4
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: 21.02 Tag: v21.02.1
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
echo -e '\nOpenwrt by M.A.R.C\n'  >> package/base-files/files/etc/banner
sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_REVISION='$(date "+%Y.%m.%d")'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='Openwrt by M.A.R.C'" >> package/base-files/files/etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='openwrt'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate

#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other config started -------------------------------
#
echo "dtparam=i2c_arm=on,audio=on" >> target/linux/bcm27xx/image/config.txt
mkdir -p files/etc/uci-defaults/
cp $GITHUB_WORKSPACE/scripts/init-settings-rpi4.sh files/etc/uci-defaults/99-init-settings
mkdir -p files/etc/config/
cp $GITHUB_WORKSPACE/scripts/passwall-default files/etc/config/passwall
cp $GITHUB_WORKSPACE/scripts/custom-firewall-rpi4 files/etc/firewall.user
#
# ------------------------------- Other config ends -------------------------------
