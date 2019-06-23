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

### 実行手順

1. **/app** ディレクトリ配下にWebアプリケーションファイルを配置する。
2. **docker-compose up --build -d** コマンドを実行する。
3. **https://localhost/{path}** にアクセスし、Webアプリケーションを実行
4. **docker-compose down** コマンドで終了する。


## ディレクトリ構造

```
$ tree
.
├── README.md
├── app                         # Webアプリケーションの保存場所
│   └── index.html
├── assets                      # 資材
│   └── nginx
│       ├── conf.d              ## Nginxのコンフィグ
│       │   └── default.conf
│       ├── nginx.conf          ## Nginxのベースコンフィグ
│       └── ssl                 ## SSL証明書ディレクトリ（※本リポジトリでは自己証明書を利用）
│           ├── server.crt
│           └── server.key
├── containers                  # Dockerコンテナ設定
│   └── nginx
│       └── Dockerfile
├── docker-compose.yml
└── log                         # logフォルダ
    └── nginx
```

## 実行コマンド

* 起動

```
$ docker-compose up --build -d
```

* ページアクセス

```
$ curl https://localhost --insecure
```

* プロセス確認

```
$ docker-compose ps
      Name                     Command              State                    Ports
----------------------------------------------------------------------------------------------------
dockernginx_php_1   docker-php-entrypoint php-fpm   Up      9000/tcp
dockernginx_web_1   nginx -g daemon off;            Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

* ログ確認

```
$ tail -f log/nginx/access.log
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
| Composer | 1.8.6 | PHPインストーラ |
