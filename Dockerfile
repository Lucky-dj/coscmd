FROM debian

USER root

WORKDIR /ect/apt

# 替换源文件
COPY apt/sources.list sources.list

WORKDIR /root

RUN apt update && apt upgrade && apt install curl python python-pip vim -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

RUN sources .bashrc

# 安装 coscmd
RUN pip install coscmd