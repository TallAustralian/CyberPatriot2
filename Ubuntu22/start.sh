#!/usr/bin/bash
echo "Setting up script..."

apt update -y
apt upgrade -y
apt update --fix-missing -y

apt install python3 -y
apt install python3-pip -y || apt install python-pip -y

pip3 install --break-system-packages argparse ||  pip install --break-system-packages argparse
#sudo -u $(logname) pip3 install os-sys
pip3 install --break-system-packages lib-platform || pip install --break-system-packages lib-platform
pip3 uninstall crontab || pip uninstall crontab
pip3 install --break-system-packages python-crontab || pip install --break-system-packages python-crontab
pip3 install --break-system-packages pexpect || pip install --break-system-packages pexpect
pip3 install --break-system-packages regex || pip install --break-system-packages regex

echo "Finished setting up!"

SCRIPT=$(readlink -f $0)
SCRIPTPATH=$(dirname $SCRIPT)

python3 "$SCRIPTPATH/main.py" -v
