FROM python:3.10.6-bullseye

ENV TEST_USER=test \
    TEST_GROUP=root 
    # PATH=/home/${TEST_USER}/.local/bin:$PATH

RUN echo "PATH=/home/${TEST_USER}/.local/bin:$PATH" > /etc/profile.d/mypath.sh

RUN apt update && apt install  openssh-server sudo -y && \
    pip install -U --no-cache-dir pip ansible

RUN useradd -rm -d /home/${TEST_USER} -s /bin/bash -g ${TEST_GROUP} -G sudo -u 1000 ${TEST_USER}

RUN  echo "${TEST_USER}:${TEST_USER}" | chpasswd

COPY ansible.pub /home/${TEST_USER}/.ssh/authorized_keys

RUN chown -R ${TEST_USER}:${TEST_GROUP} /home/${TEST_USER}/.ssh && chmod  700 /home/${TEST_USER}/.ssh && chmod  600 /home/${TEST_USER}/.ssh/authorized_keys

RUN service ssh start



EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]


