# ansible-tutorial
Following Jay's tutorial from Youtube channel learn linux tv [link](https://www.youtube.com/watch?v=3RiVKs8GHYQ&list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70)


## create a ssh ed25519 key -> -C option to add a comment
ssh-keygen -t ed25519 -C "Ansible tutorial wo passphrase"

## copy the key to the server (a docker container) -> -p=port, -i=key path
ssh-copy-id -i ~/.ssh/ansible.pub -p '2200' test@localhost

## validate and obtain information about your Ansible inventory
ansible-inventory -i inventory --list

## miscellaneous
### replace python interpreter on inventory files
grep -RiIl 'ansible_python_interpreter=/opt/rh/rh-python38/root/usr/bin/python3.8' | xargs  -t  sed -i 's/ansible_python_interpreter=[/]opt[/]rh[/]rh-python38[/]root[/]usr[/]bin[/]python3.8/ansible_python_interpreter=\/usr\/bin\/python3/'

[source](https://www.internalpointers.com/post/linux-find-and-replace-text-multiple-files)

## ATTENTION
Most Ansible modules that execute under a POSIX environment require a Python interpreter on the target host. Unless configured otherwise, Ansible will attempt to discover a suitable Python interpreter on each target host the first time a Python module is executed for that host. [link_to_ansible_doc](https://docs.ansible.com/ansible/latest/reference_appendices/interpreter_discovery.html)
