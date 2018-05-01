FROM python:latest

LABEL maintainer="y-takahashi. <ukitiyan@gmail.com>"

RUN pip install awscli

RUN apt-get update && \
  apt-get remove --purge nodejs && \
  apt-get install -y curl && \
  curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get install -y nodejs && \
  npm install npm@latest -g && \
  npm install serverless -g

WORKDIR /opt/app
