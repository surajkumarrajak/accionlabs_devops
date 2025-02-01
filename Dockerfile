#Dockerfile for nginx 1.19
#Write a Dockerfile to run nginx version 1.19 in a container. Choose a base image, considering security best practices, and aim for the image to pass a container image security test

FROM alpine.3.14 as base

WORKDIR /var/http/

RUN apt-get update
RUN apt install ngnix:1.19

ENTRYPOINT ["nginx", "8080"]
