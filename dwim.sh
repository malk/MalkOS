#!/bin/sh

set -e

command -v git >/dev/null 2>&1 || {
    apt-get -y install git
}

command -v ansible-pull >/dev/null 2>&1 || {
    apt-get -y install software-properties-common
    apt-add-repository -y ppa:ansible/ansible
    apt-get -y update
    apt-get -y install ansible
}

ansible-pull --directory=/tmp/MalkOS/ --url=http://github.com/malk/MalkOS.git -v
