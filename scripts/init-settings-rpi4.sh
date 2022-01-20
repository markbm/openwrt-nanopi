#!/bin/bash
#=================================================
# File name: init-settings-rpi4.sh
# Description: This script will be executed during the first boot
#=================================================
uci set luci.dhcp.wan=dhcp
uci set luci.dhcp.wan.interface='wan'
uci set luci.dhcp.wan.ignore='1'
uci set luci.network.wan=interface
uci set luci.network.wan.device='eth0'
uci set luci.network.wan.proto='dhcp'
uci set luci.firewall.@zone[1].network='wan'
uci commit

exit 0
