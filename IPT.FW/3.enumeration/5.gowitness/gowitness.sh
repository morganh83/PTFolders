#!/bin/bash

REQUIRED_PKG="google-chrome-stable"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome-stable_current_amd64.deb
fi

FILE=./google-chrome-stable_current_amd64.deb
if test -f "$FILE"; then
    rm $FILE
fi

chmod +x .gowitness
./.gowitness nmap -f ../2.nmap/*.xml --port 80,443,8080,8443

chmod 777 ./screenshots