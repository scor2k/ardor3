## NXT

Docker container for the Nxt cryptocurrency [https://www.jelurida.com/]. Made by Nxter Team [https://www.nxter.org]

### How to run

I advice you to use `docker-compose` to run Nxt node. Simple and usefull configuration.

```
/home/user
       |--NXT
       |----docker-compose.yml
       |----db\
       |----conf\
              |-- nxt.properties
```

You can put your Nxt database into `db` directory and your `nxt.properties` into `conf` directory. 

```
version: '2.1'

services:
  nxt:
    container_name: nxt
    hostname: nxt
    image: "scor2k/nxt:1.11.10"
    ports:
      - "7876:7876"
      - "7874:7874"
    volumes:
      - ./db:/nxt/nxt_db
      - ./conf/nxt.properties:/nxt/conf/nxt.properties
    restart: always
    mem_limit: 512M
    memswap_limit: 1024M
```

Then just type `docker-compise up -d` to run Nxt.
