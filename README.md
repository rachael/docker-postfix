# docker-postfix [![Docker Pulls](https://img.shields.io/docker/pulls/rachaelp/docker-postfix.svg?maxAge=3600)](https://hub.docker.com/r/rachaelp/docker-postfix) [![CircleCI](https://img.shields.io/circleci/project/rachael/docker-postfix.svg?maxAge=3600)](https://circleci.com/gh/rachael/docker-postfix) [![GitHub forks](https://img.shields.io/github/forks/rachael/docker-postfix.svg?style=social&label=Fork&maxAge=3600)](https://github.com/rachael/docker-postfix)

Postfix docker image configured for mail.rachael.io. Forwards from `*@rachael.io` to `rachael.passov+rachaelio@gmail.com` and allows me to send mail from gmail as `anything@rachael.io` (once I've set up the alias at gmail.com).

To use this for yourself, here are the things to replace:
  1. hostname: `rachael.io` and `mail.rachael.io`
  2. postfix container username: `rae`
  3. forwarding address: `rachael.passov+rachaelio@gmail.com`

## Gmail send as

#### On your box:

Install sasl2-bin on the host machine:
```
sudo apt install sasl2-bin
```

Make sure the following is in /etc/default/saslauthd:
```
OPTIONS="-c -m /var/run/saslauthd"
```

#### At gmail.com:

Configure Gmail to send as `whatever@rachael.io`, user `rae`, port `25`.

That's `whatever@yourhostname`, user `yourusername`, port `25` unless you've configured their default 587.

Alias option should be checked but keep in mind for testing purposes anything sent from this address will skip the inbox. No, the send as address and username don't have to match.

## Run the container

Recommend saving the following as `run` in your `$HOME` directory.
Change the hostname and container name if you're not me.
```bash
#!/bin/bash
docker stop postfix
docker rm postfix
docker run -d --name=postfix --hostname mail.rachael.io \
        -v /var/run/saslauthd:/var/spool/postfix/var/run/saslauthd \
        -p 25:25 --restart=always rachaelp/docker-postfix
```

## Last but not least: DNS

Make sure you have MX and A records set up for your `mail` subdomain (the A record should point to the host box running this container), and a CNAME from your `smtp` subdomain to your `mail` subdomain.

## TODO

A generic image with a configuration script so you don't have to manually replace my shit. Really though it's not that hard so it'll probably be a while if ever :)
