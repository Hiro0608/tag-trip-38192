## README

## 概要

* オリジナルアプリで作成した画像投稿共有サービスアプリケーションです。（実装中）

## 開発状況

* 開 発 環 境：HTML/CSS/Ruby/Ruby on Rails/JavaScript/Github/MySQL
* 開 発 期 間：約4週間
* 平均作業時間：約7時間

## 本番環境

* URL https://tag-trip-38192.herokuapp.com/ (実装中)

* ID: admin
* Pass: 2222

* テスト用アカウント
* <投稿者用>
* メールアドレス: 
* パスワード: 
* <閲覧者用>
* メールアドレス: 
* パスワード: 

## 動作確認方法

* Chromeの最新版を利用してアクセスしてください。ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。

* 接続先およびログイン情報については、上記の通りです。なお、同時に複数の方がログインしている場合に、ログインできない可能性がございます。

* ★投稿方法は以下の手順で確認できます
* テストアカウントでログイン→トップページから新規投稿ボタン押下→新規投稿情報入力→新規投稿→他投稿者の閲覧、コメント可能

* ★閲覧方法は以下の手順で確認できます
* テストアカウントでログイン→トップページから投稿内容を選択→投稿内容を閲覧→コメント入力可能

* ★確認後、ログアウト処理をお願いします。

## 開発を通じて得られた知見

### 工夫した点

* １）SNS認証でログインができるように実装をいたしました。FacebookとGoogleの外部APIをそれぞれログイン機能にて設定し実装いたしました。
* ２）投稿共有サービスをより使いやすくするにはスマホ・タブレットでも使えるようにすれば利便性が向上すると思いレスポンシブデザイン対応に取り組みました。


### 苦労した点

* １）エラー対応にて苦労をいたしました。当初は宿泊の予約サイトのようなアプリを作成しようと思っていたのですが、予約機能やカレンダーの機能など不明な点が多く時間が過ぎてゆくばかりでした。このままでは良くないを思い、自分が実装できるアプリのレベルでオリジナルアプリを作成し追加実装を増やすことに致しました。
* ２）デプロイで苦労をいたしました。これまで、ローカルで正常に実装を行なっていたのに不明なエラーが発生しデプロイができなくなるという事が何度もありました。そのような事を防ぐために、アプリ作成の最初の段階からデプロイを行い、リモートへ新しい機能をマージして本番環境へデプロイを行うたびに、追加した機能だけではなく実装済みの機能も問題なく動くかテストを行いました。これによりデプロイ後に起きたエラーの原因を特定しやすくなりました。

## 課題や今後実装したい機能

* ★今後実装したい機能は下記の機能となります。

* タグ機能
* 星レビュー機能
* 画像複数枚投稿機能


## DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| birthday           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false, unique: true |

### Association

* has_many :tweets
* has_many :comments
* has_many :sns_credentials

## tweets table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| title              | string              | null: false                    |
| place              | string              | null: false                    |
| introduction       | text                | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user
* has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| tweet       | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

* belongs_to :tweet
* belongs_to :user

## sns_credentials table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| provider           | string              | null: false                    |
| uid                | string              | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

* belongs_to :user