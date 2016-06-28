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
