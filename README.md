```shell
docker build ./ -t centos_apache
```
```shell
docker run -it -p 8080:8080 --name myapache centos_apache /bin/bash
```
```shell
yum -y install epel-release
```
```shell
yum -y install httpd mod_pear1
```
```shell
yum -y install firewalld
```

