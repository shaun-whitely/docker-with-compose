FROM docker:stable

RUN which bash || (apk update && apk add bash)
RUN which pip3 || (apk update && apk add python3)
RUN which docker-compose || pip3 install docker-compose

CMD [ "bash" ]