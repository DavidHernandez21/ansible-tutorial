## build the docker image
DOCKER_BUILDKIT=1 docker build --secret id=mysecret,src=user_password.txt --progress=plain -t bullseye-ansible:0.3.1 .

## start docker container --> 0.3.0 is the tag of the image
bash start_ansible_container.sh 0.3.0