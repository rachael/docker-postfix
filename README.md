### docker-postfix

Postfix docker image configured for mail.rachael.io

#### Gmail send as

Install sasl2-bin on host machine
```
sudo apt install sasl2-bin
```

Make sure the following is in /etc/default/saslauthd
```
OPTIONS="-c -m /var/run/saslauthd"
```

Configure Gmail to send as whatever@rachael.io, user rae, port 25.

#### Run the container

Recommend saving the following as `run` in your `$HOME` directory.
```bash
#!/bin/bash
docker stop postfix
docker rm postfix
docker run -d --name=postfix --hostname mail.rachael.io \
        -v /var/run/saslauthd:/var/spool/postfix/var/run/saslauthd \
        -p 25:25 --restart=always rachaelp/docker-postfix
```

