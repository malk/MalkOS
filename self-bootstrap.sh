#!/bin/sh

set -e

command -v git >/dev/null 2>&1 || {
    apt-get -y install git
}

mkdir -p /opt
cd /opt

if [ -d MalkOS ]
then
    cd MalkOS
    git pull origin master
else
    git clone http://github.com/malk/MalkOS.git
    cd MalkOS
fi

