#!/bin/bash
#=================================================
# File name: init-settings-rpi4.sh
# Description: This script will be executed during the first boot
#=================================================

uci set dhcp.wan=dhcp
uci set dhcp.wan.interface='wan'
uci set dhcp.wan.ignore='1'
uci set network.wan=interface
uci set network.wan.device='eth1'
uci set network.wan.proto='dhcp'
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
