# DokcerによるWebサーバ環境

Dockerを活用したWebサーバ環境です。

## 実行環境

| ミドルウェア | バージョン |
| :---- | :---- |
| Docker | 18.09.2 |
| docker-composer | 1.23.2 |
| docker-machine | 0.16.1 |

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
          Name                        Command              State                    Ports
-----------------------------------------------------------------------------------------------------------
dockernginxlaravel_web_1   nginx -g daemon off;            Up      0.0.0.0:443->443/tcp, 0.0.0.0:80->80/tcp
```

* プロセス停止

```
$ docker-compose down
```
