FROM node:latest

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y npm   
RUN mkdir /usr/src/server

WORKDIR /usr/src/server

COPY . /usr/src/server

EXPOSE 8080

RUN npm install

CMD npm run dev