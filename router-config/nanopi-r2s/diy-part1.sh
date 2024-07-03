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

echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git" >> "feeds.conf.default"
echo "src-git passwall-packages https://github.com/xiaorouji/openwrt-passwall-packages.git" >> "feeds.conf.default"
cd package
# git clone https://github.com/vernesong/OpenClash.git/luci-app-openclash package/luci-app-openclash
git clone https://github.com/gSpotx2f/luci-app-cpu-status.git
git clone https://github.com/gSpotx2f/luci-app-temp-status.git
cd ..

