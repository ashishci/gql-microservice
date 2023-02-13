FROM node:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y yarn   
RUN mkdir /usr/src/server

WORKDIR /usr/src/server

COPY . /usr/src/server

EXPOSE 4000

RUN yarn install

CMD yarn dev