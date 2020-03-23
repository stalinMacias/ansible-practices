#!/bin/bash
if [ -n "$1" ]; then
  echo "This script it is not required to receibe parameters"
  exit
else
  ansible-playbook unarchive_file.yml
fi
