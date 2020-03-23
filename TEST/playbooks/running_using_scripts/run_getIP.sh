#!/bin/bash

if [ -n "$1" ]; then
  echo "Parameter receibed is: $1"
else
  echo "No parameter was receibed"
  exit
fi


ansible-playbook getIP.yml
