FROM ubuntu:xenial

RUN apt -y update && apt install -y postfix rsyslog
RUN useradd -m -U rae \
 && adduser postfix sasl

ADD etc /etc/

ADD start /usr/local/bin/

CMD start

EXPOSE 25
