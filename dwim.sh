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
    else
	git merge origin master
    fi
else
    git clone http://github.com/malk/MalkOS.git
    cd MalkOS
fi

if [ ! $current_script_is_latest ]
then
    exec dwim.sh
fi

command -v ansible-playbook >/dev/null 2>&1 || {
    apt-get -y install software-properties-common
    apt-add-repository ppa:ansible/ansible
    apt-get -y update
    apt-get -y install ansible
}
