FROM centos/python-38-centos7
# FROM centos/systemd
USER root

ENV TEST_USER=test \
    TEST_GROUP=root 

RUN yum update -y && \
    yum install  openssh-server sudo -y && \
    /usr/bin/ssh-keygen -A

RUN useradd -rm -d /home/${TEST_USER} -s /bin/bash -g ${TEST_GROUP} -G root -u 1000 ${TEST_USER}

# RUN  --mount=type=secret,id=mysecret cat /run/secrets/mysecret | chpasswd
RUN echo "${TEST_USER}:${TEST_USER}" | chpasswd

COPY ansible.pub /home/${TEST_USER}/.ssh/authorized_keys

RUN chown -R ${TEST_USER}:${TEST_GROUP} /home/${TEST_USER}/.ssh && \
    chmod  700 /home/${TEST_USER}/.ssh && \
    chmod  600 /home/${TEST_USER}/.ssh/authorized_keys 

# RUN systemctl start sshd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]