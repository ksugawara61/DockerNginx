# DokcerによるWebサーバ環境

Dockerを活用したWebサーバ環境です。

## 実行環境

| ミドルウェア | バージョン |
| :---- | :---- |
| Docker | 18.09.2 |
| docker-composer | 1.23.2 |
| docker-machine | 0.16.1 |

## 使い方

以下の手順で配置したWebアプリケーションを実行することができます。<br>
本アプリケーションは **.html**, **.htm** ファイルのアプリケーションに対応しています。

### 事前準備

本環境で各アプリの実行環境にアクセスするためには、ローカルのhostsを以下のように設定する必要があります。

### hostsに設定する内容

| IPアドレス | FQDN | 動作アプリ環境 |
| :--- | :--- | :--- |
| 127.0.0.1 | web.docker.example.com | HTML |
| 127.0.0.1 | php.docker.example.com | PHP (CodeIgniter3) |
| 127.0.0.1 | ruby.docker.example.com | Ruby |
| 127.0.0.1 | python.docker.example.com | Python |

### 実行手順

1. **/app** ディレクトリ配下にWebアプリケーションファイルを配置する。
2. **docker-compose up --build -d** コマンドを実行する。
3. **https://${fqdn}/${path}** にアクセスし、Webアプリケーションを実行
4. **docker-compose down** コマンドで終了する。


## ディレクトリ構造

```
$ tree
.
├── README.md
├── app                         # Webアプリケーションの保存場所
│   ├── php                     ## PHPアプリ
│   │   └── public
│   │       └── index.php
│   ├── python                  ## Pythonアプリ
│   │   └── app.py
│   ├── ruby                    ## Rubyアプリ
│   └── web                     ## HTMLアプリ
│       └── index.html
├── assets                      # 資材
│   ├── nginx
│   │   ├── conf.d              ## Nginxのコンフィグ
│   │   │   ├── common
│   │   │   │   └── ssl.conf
│   │   │   ├── default.conf
│   │   │   ├── php-app.conf
│   │   │   ├── python-app.conf
│   │   │   ├── ruby-app.conf
│   │   │   └── web-app.conf
│   │   ├── nginx.conf          ## Nginxのベースコンフィグ
│   │   └── ssl                 ## SSL証明書ディレクトリ（※本リポジトリでは自己証明書を利用）
│   │       ├── server.crt
│   │       └── server.key
│   └── php
├── containers                  # Dockerコンテナ設定
│   ├── nginx
│   │   └── Dockerfile
│   ├── php
│   │   └── Dockerfile
│   ├── python
│   │   └── Dockerfile
│   └── ruby
│       └── Dockerfile
├── docker-compose.yml
└── log                         # logフォルダ
    ├── nginx
    │   ├── default
    │   ├── php
    │   ├── python
    │   ├── ruby
    │   └── web
    ├── php
    │   └── codeigniter
    └── ruby
```

## 実行コマンド

* 起動

```
$ docker-compose up --build -d
```

* ページアクセス

```
$ curl https://web.docker.example.com --insecure
Hello world!
```

* プロセス確認

```
$ docker-compose ps
       Name                     Command               State                    Ports
------------------------------------------------------------------------------------------------------
dockernginx_php_1     docker-php-entrypoint php-fpm    Up      9000/tcp
ockernginx_python_1   /bin/sh -c source /etc/pro ...   Up      0.0.0.0:5000->5000/tcp
dockernginx_ruby_1    /bin/sh -c source /etc/pro ...   Up
dockernginx_web_1     nginx -g daemon off;             Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

* ログ確認

```
$ tail -f log/*/*.log
172.19.0.1 - - [23/Jun/2019:18:45:39 +0900] "GET / HTTP/1.1" 200 12 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36" "-"
```

* プロセス停止

```
$ docker-compose down
```

## コンテナ環境

* dockernginx_web

| ミドルウェア | バージョン | 備考 |
| :---- | :---- | :---- |
| Nginx | latest | Webサーバ |

* dockernginx_php

| ミドルウェア | バージョン | 備考 |
| :---- | :---- | :---- |
| PHP | 7.X | PHP |
| Composer | 1.8.6 | PHPのライブラリインストーラ |

* dockernginx_ruby

| ミドルウェア | バージョン | 備考 |
| :---- | :---- | :---- |
| Ruby | 2.6.3p62 | rbenvでインストールしたRuby |
| rbenv | 1.1.2-2-g4e92322 | rbenv |

* dockernginx_python

| ミドルウェア | バージョン | 備考 |
| :---- | :---- | :---- |
| Python | 3.7.3 | pyenvでインストールしたPython |
| pyenv | 1.2.12-2-geb68ec9 | pyenv |
