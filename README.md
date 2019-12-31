# docker-lamp

Docker example with Apache, MySql 5.7, PhpMyAdmin and Php 5.7

Before start please create `www`  folder with any `index.php` For example like this:
```
mkdir www
echo "<?php phpinfo()'?>" > ./www/index.php
```

To init container please start
```
docker-compose up -d
```

Open phpmyadmin at [`http://localhost:8000`](http://localhost:8080)

Open web browser to look at a simple php example at [`http://localhost`](http://localhost)

Run mysql client:

- `docker-compose exec db mysql -u root -p`

Enjoy !
```
docker ps

docker ps -aq

docker stop $(docker ps -aq) && docker rm  $(docker ps -aq)

docker rm $(docker ps -aq)

docker volume ls

docker volume rm $(docker volume ls -q)

docker-compose up --build --force-recreate
```

__#Logs__
```
docker logs lamp-72_www_1 -f

docker logs lamp-72_www_1 -f > /dev/null

docker logs lamp-72_www_1 -f 2> /dev/null
```
__#MySQL Console__
```
docker exec -it lamp-72_db_1 mysql -u root -p
```

__#Shell Console__

```
docker exec -it lamp-72_www_1 bash -l
```

