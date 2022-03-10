#!/bin/bash
#========================================================================================================================
# https://github.com/markbm/openwrt-nanopi
# Description: Automatically Build OpenWrt for nanopi r2s
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: 21.02 Tag: v21.02.1
#========================================================================================================================

# Uncomment a feed source
# sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default
# sed -i 's/\"#src-git\"/\"src-git\"/g' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

echo "src-git helloworld https://github.com/fw876/helloworld.git" >> "feeds.conf.default"
mkdir -p package/helloworld
for i in "dns2socks" "microsocks" "ipt2socks" "pdnsd-alt" "redsocks2"; do \
  svn checkout "https://github.com/immortalwrt/packages/trunk/net/$i" "package/helloworld/$i"; \
done
# echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git" >> "feeds.conf.default"
echo "src-git passwall https://github.com/Coolkids/openwrt-passwall.git" >> "feeds.conf.default"
svn checkout "https://github.com/vernesong/OpenClash.git/trunk/luci-app-openclash" "package/luci-app-openclash"
mkdir -p package/luci-app-cpu-status
svn checkout "https://github.com/gSpotx2f/luci-app-cpu-status/trunk" "package/luci-app-cpu-status"
mkdir -p package/luci-app-temp-status
svn checkout "https://github.com/gSpotx2f/luci-app-temp-status/trunk" "package/luci-app-temp-status"
