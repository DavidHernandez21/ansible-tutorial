# ansible-tutorial
Following Jay's tutorial from Youtube channel learn linux tv


## create a ssh ed25519 key -> -C option to add a comment
ssh-keygen -t ed25519 -C "Ansible tutorial wo passphrase"

## copy the key to the server (a docker container) -> -p=port, -i=key path
ssh-copy-id -i ~/.ssh/ansible.pub -p '2200' test@localhost
