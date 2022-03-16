#!/bin/bash

# Get the remote IP address for the active connection
IP=$(/usr/bin/who -m --ips|/usr/bin/awk '{print $6}')

# Get the current default gateway
GW=$(route -n | /usr/bin/grep -e ^0.0.0.0 | /usr/bin/awk '{print $2}')

# Add a new host route for the remote host
route add -host $IP gw $GW
