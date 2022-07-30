# ansible-tutorial
Following Jay's tutorial from Youtube channel learn linux tv


## create a ssh ed25519 key -> -C option to add a comment
ssh-keygen -t ed25519 -C "Ansible tutorial wo passphrase"

## copy the key to the server (a docker container) -> -p=port, -i=key path
ssh-copy-id -i ~/.ssh/ansible.pub -p '2200' test@localhost

## ATTENTION
Most Ansible modules that execute under a POSIX environment require a Python interpreter on the target host. Unless configured otherwise, Ansible will attempt to discover a suitable Python interpreter on each target host the first time a Python module is executed for that host. [link_to_ansible_doc](https://docs.ansible.com/ansible/latest/reference_appendices/interpreter_discovery.html)
