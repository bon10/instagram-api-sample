# README

## 前提

- Docker
- docker compose
- Ruby 2.4.2

## Facebook API　Developerの設定

### テストアプリ作成

以下にアクセスし、「新しいアプリを追加」をクリック
[https://developers.facebook.com/apps/](https://developers.facebook.com/apps/)

何かしらのアプリをつくる。

その後再度[https://developers.facebook.com/apps/](https://developers.facebook.com/apps/)にアクセスし、
先程作成したアプリにマウスオーバーすると、右上に「▼」が表示されるのでそれクリックし「テストアプリを作成」を選択。

### ローカルテスト環境の設定

[https://developers.facebook.com/](https://developers.facebook.com/)から右上メニューの [マイアプリ] > 作成したテストアプリ を選択

中央の「製品の追加」から **Facebook ログイン** の「設定」をクリック。すると左メニューの「プロダクト」に「Facebookログイン」が追加される。

次に左メニューの「設定」から「ベーシック」をクリック。

中央に表示された「アプリドメイン」に `localhost` を入力。  
さらに下へスクロールし、「ウェブサイト」の「サイトURL」に `http://localhost:3000/` を入力。

参考： [https://stackoverflow.com/a/57607570](https://stackoverflow.com/a/57607570)


## DB環境と開発環境の構築

### DB

#### Using Docker

Docker の場合以下を実行する

```
./run.sh dev
```

#### Using Windows/mac/Linux

MySQLを `localhost:3360` で立ち上げる。  
ユーザ名、パスワードは `root`, `password`（もしくはdatabase.ymlを変更）

#### アプリ環境構築

```
# cd /app
# bundle install --path=vendor/bundle
# bundle exec rake db:create
# bundle exec rake db:migrate
```

その後 `.env.sample` を `.env` にリネームし、 `FACEBOOK_APP_ID` および `FACEBOOK_APP_SECRET` を入力

サーバー起動（Windowsは手動で頑張る)

```
./run.sh start
```

[http://localhost:3000](http://localhost:3000)で接続
