#!/bin/bash
cat <<< '
- hosts: localhost
  vars_files:
    - 'defaults/main.yml'
  tasks:
    - include: 'tasks/main.yml'
'> ./test.yml

cat <<< 'localhost' > ./inventory

ansible-playbook --syntax-check -i ./inventory ./test.yml
