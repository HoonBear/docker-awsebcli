#base docker-image
FROM amazonlinux:latest

#maintainer
MAINTAINER BLUEPET-BACK-END

#default work directory
WORKDIR /home

#Preparing yum package install
RUN yum update -y
RUN yum upgrade -y

#Installing Git
RUN yum install -y git

#Installing node
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum clean all && yum makecache fast
RUN yum install -y gcc-c++ make
RUN yum install -y nodejs

#Installing deployment dependencies
RUN yum install -y python37
RUN python3 --version
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py --user
RUN pip3 install --force-reinstall awsebcli --upgrade --user

#Listening PORT in Virtual Machine
EXPOSE 80
