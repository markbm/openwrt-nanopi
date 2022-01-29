#!/bin/bash
#=================================================
# File name: init-settings-nanopi_r2s.sh
# Description: This script will be executed during the first boot
#=================================================

uci set network.usb0=interface
uci set network.usb0.proto='dhcp'
uci set network.usb0.device='usb0'
uci set network.usb0.auto='0'
uci set firewall.@zone[1].network='wan usb0'
uci set system.@system[0].hostname='NanoPi-R2S'
uci set system.@system[0].zonename='Asia/Kuala Lumpur'
uci set system.@system[0].timezone='<+08>-8'

uci commit

sed -i '/helloworld/d' /etc/opkg/distfeeds.conf
sed -i '/passwall/d' /etc/opkg/distfeeds.conf

exit 0
