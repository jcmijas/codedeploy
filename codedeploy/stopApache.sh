#!/bin/bash
service httpd stop
if [ -L /opt/current-deployment ]; then
    unlink /opt/current-deployment
fi
sudo rm -f /etc/httpd/conf/httpd.conf