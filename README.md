# docker-lamp

Docker example with Apache, MySql 5.7, PhpMyAdmin and Php 5.7

## Instalation
### Prepare WWW folder
Before start please create `www` folder with you project file or any `index.php` For example like this:
```
mkdir www
echo "<?php phpinfo()'?>" > ./www/index.php
```
### Setup mysql in PHP project
When you configure your mysql connection in php please use `db` as `hostname` parameter. 
Other parameters like `user name`,  `password`, `database name` you can take from from `.env` file

Then copy your SQL dump to the `/dump` folder. It can be any file with `.sql` extension. 

### Start installation
To init container please start a command
```
docker-compose up -d
```
> Test a container
- Open phpmyadmin at [`http://localhost:8000`](http://localhost:8080)

- Open web browser to look at a simple php example at [`http://localhost`](http://localhost)

- Run mysql client: `docker-compose exec db mysql -u root -p`

## Useful commands
```
docker ps

docker ps -aq

docker stop $(docker ps -aq) && docker rm  $(docker ps -aq)

docker rm $(docker ps -aq)

docker volume ls

docker volume rm $(docker volume ls -q)

docker-compose up --build --force-recreate
```

## Logs
```
docker logs lamp-72_www_1 -f

docker logs lamp-72_www_1 -f > /dev/null

docker logs lamp-72_www_1 -f 2> /dev/null
```
## MySQL Console
```
docker exec -it lamp-72_db_1 mysql -u root -p
```

## Shell Console

```
docker exec -it lamp-72_www_1 bash -l
```

