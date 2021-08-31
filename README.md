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

```shell
# create User model
rails g model User full_name:string password_digest:string
rails db:migrate
rails g controller api::v1::users
```

3. 运行单元测试

```shell
ralis test
```

## jwt

> json web token

1. base64(header) : 包含当前token的功能性描述，例如：时间，加密算法，数据类型等
2. base64(payload) : 载荷，存储自定义数据的地方，数据容器
3. base64(signature) : 签名，保证token的有效性

> baser64(header).baser64(payload).base64(signature)
