# README

## setup

1. docker创建mysql数据持久化处理

```shell
docker run --name mysqldb -v /mnt/mysql:/var/mysql -e MYSQL_ROOT_PASSWORD=[password] -e MYSQL_ROOT_HOST=% -p 3306:3306  -d mysql 
```

2. 创建开发用数据库

```shell
ralis db:create RAILS_ENV=development
```

