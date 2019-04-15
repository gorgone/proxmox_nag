#!/bin/bash

clear

f1="/usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js"
f2="/usr/share/pve-manager/js/pvemanagerlib.js"

#backup
[ -f $f1 ] && [ ! -f $f1".bak" ] && echo -e "backup $f1 \nto $f1.bak" && cp $f1 $f1.bak
[ -f $f2 ] && [ ! -f $f2".bak" ] && echo -e "backup $f2 \nto $f2.bak" && cp $f2 $f2.bak

#restore
#[ -f $f1".bak" ] && echo -e "restore $f1.bak \nto $f1" && cp $f1.bak $f1
#[ -f $f2".bak" ] && echo -e "restore $f2.bak \nto $f2" && cp $f2.bak $f2

sed -i "s@if (data.status !== 'Active') {@if (false) {@g" $f1;
sed -i "s@noSubKeyHtml: 'You do not have a valid subscription for this server. Please visit <a target=\"_blank\" href=\"http://www.proxmox.com/products/proxmox-ve/subscription-service-plans\">www.proxmox.com</a> to get a list of available options.',@noSubKeyHtml: 'This server is receiving updates from the Proxmox VE No-Subscription Repository. Please visit <a target=\"_blank\" href=\"http://www.proxmox.com/products/proxmox-ve/subscription-service-plans\">www.proxmox.com</a> to get a list of available options.',@g" $f2;
sed -i "s@invalidHtml: '<h1>No valid subscription</h1>' + PVE.Utils.noSubKeyHtml,@invalidHtml: '<h1>Community Edition</h1>' + PVE.Utils.noSubKeyHtml,@g" $f2;
