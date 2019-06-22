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
└── docker-compose.yml
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
      Name                Command          State                    Ports
-------------------------------------------------------------------------------------------
dockernginx_web_1   nginx -g daemon off;   Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

* ログ確認

```
$ docker-compose logs -f
Attaching to dockernginx_web_1
web_1  | 172.20.0.1 - - [23/Jun/2019:00:12:05 +0900] "GET / HTTP/1.1" 200 12 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36" "-"
```

* プロセス停止

```
$ docker-compose down
```
