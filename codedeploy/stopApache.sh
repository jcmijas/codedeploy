#!/bin/bash
service nginx stop
if [ -L /opt/current-deployment ]; then
    unlink /opt/current-deployment
fi
sudo rm -f /etc/nginx/nginx.conf
