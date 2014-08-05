#!/bin/sh

set -e

command -v ansible-playbook >/dev/null 2>&1 || {
    apt-get install software-properties-common
    apt-add-repository ppa:ansible/ansible
    apt-get update
    apt-get install ansible
}
