#!/bin/bash
#=================================================
# File name: init-settings-nanopi_r2s.sh
# Description: This script will be executed during the first boot
#=================================================

uci set network.usb0=interface
uci set network.usb0.proto='dhcp'
uci set network.usb0.device='usb0'
uci set network.usb0.auto='0'
uci commit

exit 0
