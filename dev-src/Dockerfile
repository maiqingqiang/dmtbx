FROM daocloud.io/node:latest

MAINTAINER dingyiming

RUN npm i -g pm2

RUN mkdir -p /home/app

WORKDIR /home/app

COPY package.json /home/app

RUN npm install

ADD . /home/app

RUN npm run build

ENTRYPOINT npm run start;sleep 100000000

EXPOSE 10000
