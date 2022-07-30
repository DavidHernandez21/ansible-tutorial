# syntax=docker/dockerfile:1

FROM debian:latest

ENV TEST_USER=test

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/${TEST_USER} -s /bin/bash -g root -G sudo -u 1000 ${TEST_USER}

RUN  --mount=type=secret,id=mysecret cat /run/secrets/mysecret | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]


