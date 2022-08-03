# FROM centos/python-38-centos7
# FROM centos/systemd
FROM centos7-systemd

# USER root

ENV TEST_USER=test \
    TEST_GROUP=root 

RUN yum update -y && \
    yum install  epel-release -y && \
    yum install openssh-server sudo python3 -y && \
    /usr/bin/ssh-keygen -A

RUN useradd -rm -d /home/${TEST_USER} -s /bin/bash -g ${TEST_GROUP} -G root -u 1000 ${TEST_USER} && \
    # add user to sudoers file
    # test ALL=(ALL) ALL
    # user on all hosts=(as any target user) can run any command
    echo "${TEST_USER} ALL=(ALL) ALL" | tee /etc/sudoers.d/${TEST_USER}

# RUN  --mount=type=secret,id=mysecret cat /run/secrets/mysecret | chpasswd
RUN echo "${TEST_USER}:${TEST_USER}" | chpasswd

COPY ansible.pub /home/${TEST_USER}/.ssh/authorized_keys

RUN chown -R ${TEST_USER}:${TEST_GROUP} /home/${TEST_USER}/.ssh && \
    chmod  700 /home/${TEST_USER}/.ssh && \
    chmod  600 /home/${TEST_USER}/.ssh/authorized_keys 

# RUN systemctl start sshd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]