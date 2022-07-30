## build the docker image
DOCKER_BUILDKIT=1 docker build --secret id=mysecret,src=user_password.txt --progress=plain -t `<image name>:<image tag>` .

## start docker container
bash start_ansible_container.sh `<image tag>`

## NOTE
you will need a public ssh key and a txt file in the Dockerbuild context e.g. inside the build_docker directory.


the txt file should be something like `<username>:<password>`
