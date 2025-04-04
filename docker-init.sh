#!/bin/bash

mkdir /hiddify-data/ssl/
rm -rf /opt/hiddify-manager/log/*.lock
cd $(dirname -- "$0")
./install.sh install-docker --no-gui $@

DO_NOT_INSTALL=true ./install.sh install-docker --no-gui $@
./apply_configs.sh --no-gui
./restart.sh --no-gui
./status.sh --no-gui

echo Hiddify is started!!!! in 5 seconds you will see the system logs
sleep 5
tail -f /opt/hiddify-manager/log/system/*