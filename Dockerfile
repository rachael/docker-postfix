FROM ubuntu:xenial

RUN apt -y update && apt install -y postfix sasl2-bin

ADD etc /etc

ADD start /usr/local/bin

CMD start

EXPOSE 25
