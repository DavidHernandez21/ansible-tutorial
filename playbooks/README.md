# runnig playbook

## working with inventory groups
ansible-playbook --ask-become-pass playbooks/inventory_groups/site.yaml

## using conditionals
ansible-playbook --ask-become-pass -i playbooks/use_when/inventory playbooks/use_when/install_nginx.yaml

## using tags
ansible-playbook --ask-become-pass --tags "apache,db" playbooks/use_tags/tags.yaml

## adding user and using new user that do not require become-pass
- ansible-playbook --ask-become-pass  playbooks/adding_users/bootstrap.yaml 
- ansible-playbook -u simone  playbooks/adding_users/adding_users.yaml

## using roles
- create a "roles" directory in the same directory of the playbook
- inside the "roles" directory create as many directories as the groups defined inside the inventory file, using the exact same names
- inside of each of the above created directories create a task directory
- inside the task directory create a main.yaml file
- inside the main.yaml file write the task for the specific role

## using variables (host_vars)
[doc](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#splitting-out-vars) and [this](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#ansible-variable-precedence)

- create a "host_vars" inside the playbook directory
- create as many yaml files as groups defined in the inventory file, tha name of the files should be the same as the groups defined in the inventory file

## using handlers
- use the "notify" key inside the task that is going to trigger the handler and give it a value
- create a "handlers" directory inside the roles/"specific_role" directory where specific_role is the directory that have the task/main.yaml file with the notify key
- inside the handlers directory create a main.yaml file and write the task for the handler, the name os this task should be the same as the value in the notify key

