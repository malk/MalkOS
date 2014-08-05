#!/bin/sh

set -e

command -v git >/dev/null 2>&1 || {
    apt-get install git
}


cd /tmp

git clone http://github.com/malk/MalkOS.git
