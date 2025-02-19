#!/bin/bash

dnf install ansible -y
#push method
#ansible-playbook -i inventory mysql.yaml

#Pull Method
ansible-pull -i localhost, -U https://github.com/obulesu2506/expense-ansible-roles-tf.git main.yaml -e COMPONENT=backend -e ENVIRONMENT=$1