# detect-new-ip6-docker image
## What is this?
Alpine Linux image which embeed detect-new-ip6 from [THC IPV6](https://github.com/vanhauser-thc/thc-ipv6).

The objective is to connect to the ipv6 network and detect all new devices. You can use environment variable to make a custom action.

## Installation
You must enable ipv6 on your docker installation. See [docker documentation](https://docs.docker.com/engine/userguide/networking/default_network/ipv6/).

## Usage Example
If your run the contener without arguments, it will only echo the new ipv6 adress inside the log.
```
docker run ppaques/detect-new-ip6-docker
```

You can also specify an environment variable COMMAND which contain the action. Adress is inside the `$ADDR` variable.

```
docker run ppaques/detect-new-ip6-docker -e COMMAND="ECHO $ADDR"
```

Rewrite the command to call an api which survey my network.
```
docker run ppaques/detect-new-ip6-docker -e COMMAND="wget http://127.0.0.1/my_network_monitoring/new_ip_detected $ADDR"
```



## Legal
I reused the code from [THC IPV6](https://github.com/vanhauser-thc/thc-ipv6). This code is on LGPL Licence and all credits goes to the author.

## "THE BEER-WARE LICENSE" (Revision 42)
<pierre@paques.eu.com> wrote this DockerFile. As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return Pierre Paques
