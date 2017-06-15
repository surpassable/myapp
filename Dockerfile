FROM server.example.com:5000/centos7
MAINTAINER peter
RUN rm -rf /etc/yum.repos.d/*
ADD server.repo /etc/yum.repos.d/server.repo
RUN yum install passwd openssl openssh-server net-tools -y
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''
EXPOSE 22
CMD ["usr/sbin/sshd","-D"]
