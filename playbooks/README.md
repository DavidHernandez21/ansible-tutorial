# runnig playbook

## working with inventory groups
ansible-playbook --ask-become-pass playbooks/inventory_groups/site.yaml

## using conditionals
ansible-playbook --ask-become-pass -i playbooks/use_when/inventory playbooks/use_when/install_nginx.yaml

## using tags
ansible-playbook --ask-become-pass --tags "apache,db" playbooks/use_tags/tags.yaml

## adding user and using new user that do not require become-pass
ansible-playbook -u simone  playbooks/adding_users/adding_users.yaml