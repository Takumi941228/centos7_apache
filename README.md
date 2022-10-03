## Docker Hubのイメージから作成

centos7のイメージをダウンロード

```shell 
docker pull centos:7
```

centos:7イメージからコンテナ名myapacheとしてsystemctlコマンドが使えるように/sbin/initでコンテナ起動

```shell
docker run -itd --privileged -p 8080:80 --name myapache centos:7 /sbin/init
```

myapacheコンテナを/bin/bashでcentos7に入る

```shell
docker exec -it myapache /bin/bash
```

インストール作業

```shell
yum -y install epel-release
```

```shell
yum -y install httpd mod_pearl
```

```shell
yum -y install firewalld
```

htmlの作成

```shell
vi /var/www/html/index.html
```

firewalld起動

```shell
systemctl start firewalld
```

httpd起動

```shell
systemctl start httpd
```

ファイアーウォールの設定

```shell
firewall-cmd --add-service http
```

```shell
firewall-cmd --add-service http --permanent
```

```shell
firewall-cmd --add-service https

```

```shell
firewall-cmd --add-service https --permanent
```

```shell
firewall-cmd --reload
```

firewalldの有効化

```shell
systemctl enable firewalld
```

httpdの有効化

```shell
systemctl enable httpd
```

httpdの再起動

```shell
systemlctl restart httpd
```

firewalldの再起動

```shell
systemctl restart firewalld
```

## Dockerfileから作成

dockerfileからイメージ名centos_apache:7としてイメージ作成

```shell
docker build ./ -t centos_apache:7
```

```shell
systemctl start firewalld
systemctl start httpd
firewall-cmd --add-service http
firewall-cmd --add-service http --permanent
firewall-cmd --add-service https
firewall-cmd --add-service https --permanent
firewall-cmd --reload
systemctl enable firewalld
systemctl enable httpd
systemlctl restart httpd
systemctl restart firewalld
```

```shell
docker run -it -p 8080:80 --name myapche centos:7 
```