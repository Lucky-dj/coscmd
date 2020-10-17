FROM debian

USER root

# 替换源文件
COPY apt/sources.list /ect/apt/sources.list

WORKDIR /root

RUN apt update && apt upgrade && apt install curl python python-pip vim -y

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash

# 安装 coscmd And node
RUN pip install coscmd && nvm install 12.19.0