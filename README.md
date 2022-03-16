# openvpn_vps_client
A script for maintaining connectivity to a VPS server after establishing a vpn connection from the VPS server


## The issue

When establishing a VPN connection from a VPS server, new default routes are added to use the vpn tunnel interface, which disable the existing routes.  This results in existing remote connectivity to the VPS server failing, such as the current SSH remote connecting used to establish the VPN tunnel.  

## The resolution

To correct, we need to add a new route to the host routing table, which will route all traffic from the existing host through the original default gateway rather than the new vpn tunnel interface.  

This can be done manually by executing the script in this repo, or alternatively, may be executed automatically through openvpn by adding the following lines to the `ovpn` file.  

```
script-security 2
up /path/to/script/add_route.sh
```
