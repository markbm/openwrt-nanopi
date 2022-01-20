#!/bin/bash
#=================================================
# File name: init-settings-rpi4.sh
# Description: This script will be executed during the first boot
#=================================================

uci set dhcp.wan=dhcp
uci set dhcp.wan.interface='wan'
uci set dhcp.wan.ignore='1'
uci set network.wan=interface
uci set network.wan.device='eth0'
uci set network.wan.proto='dhcp'
uci set firewall.@zone[1].network='wan'
uci commit

exit 0
