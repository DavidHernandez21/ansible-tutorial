# runnig playbook

## working with inventory groups
ansible-playbook --ask-become-pass playbooks/inventory_groups/site.yaml

## using conditionals
ansible-playbook --ask-become-pass -i playbooks/use_when/inventory playbooks/use_when/install_nginx.yaml