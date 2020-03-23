#!/bin/bash
if [ -n "$1" ]; then
  echo "No parameters are expected"
  exit
else
  # if no paramters were receibed, proceed to run the playbook
  ansible-playbook archive_file.yml 
fi
