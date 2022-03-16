# openvpn_vps_client
A script for maintaining connectivity to a VPS server after establishing a vpn connection from the VPS server


## The issue

When establishing a VPN connection from a VPS server, new default routes are added to use the vpn tunnel interface, which take precendence over the existing routes.  This results in any existing remote connectivity to the VPS server failing, such as the current SSH remote connecting used to establish the VPN tunnel.  

## The resolution

To correct the issue, we need to add a new route to the host routing table, which will route all traffic from the existing host through the original default gateway rather than the new vpn tunnel interface.  

This can be done manually by executing the script in this repo, or alternatively, may be executed automatically through openvpn by adding the following lines to the `ovpn` file.  

```
script-security 2
up /path/to/script/add_route.sh
```

## What does the script do?

The script will grab the IP address and default gateway for the existing remote connection, and add it to the route table.  

## How does this affect my VPN communications?

Your remote connection source address will be routed separately from the VPN tunnel established on the VPS server.  Therefore, while activity to the internet from the VPS server will be passed through the VPN, connectivity to your remote source address will not pass through the VPN tunnel.  If you require VPN connectivity to the remote address, you will need to establish a separate VPN connection from the client machine to the VPS server prior to running this script and establishing the VPS VPN.
