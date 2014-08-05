#!/bin/sh

set -e

command -v git >/dev/null 2>&1 || {
    apt-get -y install git
}

mkdir -p /opt
cd /opt

current_script_is_latest=false

if [ -d MalkOS ]
then
    cd MalkOS
    git fetch origin master
    if [ git diff --quiet origin/master ]
    then
	current_script_is_latest=true
    fi
    cd /opt
fi

if [ ! $current_script_is_latest ]
then
    rm -rf MalkOS
    git clone http://github.com/malk/MalkOS.git
    exec ./MalkOS/dwim.sh
fi

cd MalkOS

# either is installed or is not
# if installed it is either the latest or not
# if installed and latest just kep going
# else reinstall

command -v ansible-playbook >/dev/null 2>&1 || {
    apt-get -y install software-properties-common
    apt-add-repository ppa:ansible/ansible
    apt-get -y update
    apt-get -y install ansible
}
