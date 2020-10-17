FROM debian:stable

USER root

# 替换源文件
COPY apt/sources.list /etc/apt/sources.list

WORKDIR /root

RUN apt update && apt upgrade && apt install curl python python-pip vim -y

# 更换阿里源
RUN [ "mkdir", "-p", ".config/pip" ]

COPY config/pip.conf .config/pip

# 安装 coscmd
RUN [ "pip", "install", "coscmd" ]

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

RUN sources .bashrc

# 安装 node
RUN [ "nvm", "install", "12.19.0" ]