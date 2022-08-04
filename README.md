# README
# アプリケーション名
FnoBlank(エフノーブランク)
# このアプリでできること
・釣った魚を投稿できる
・魚の名前やサイズなどを入力できて、釣果情報が共有できる
・ユーザーが投稿した釣果情報に対してコメントができ、コミュニケーションが取れる
・自身の気に入った釣果情報にはいいね！ができる
・自身の投稿した内容（釣果情報）を記録できる
# URL
https://github.com/sfsf700/fnoblank

# アプリケーションを作成した背景
①自分が釣りが好きであること。
②釣果を記録する術がなかった。
③どこでどんな魚が釣れるか知りたいため、いろんな人から情報を仕入れたかった。
④１匹の魚を釣るにしても色んな道具や方法があるが、自分の知らないやり方を知りたくなった。
⑤コメント機能を実装することで、他のanglerとコミュニケーションをとってみたかった。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1swVM35dnB6zxyfvo4CL1A_YW3XE94b_FQLN888SM-8c/edit#gid=982722306

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| profile            | string  | null: false               |
| history_id         | integer | null: false               |
| field_id           | integer |                           |
| fish_name          | string  |                           |

## Association
 has_many :fishings, dependent: :destroy
 has_many :comments
 has_many :favorite

##  fishingsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| day         | date       | null: false                    |
| name        | string     | null: false                    |
| size        | integer    | null: false                    |
| count       | integer    | null: false                    |
| field_id    | integer    | null: false                    |
| memo        | string     |                                |
| user        | references | null: false, foreign_key: true |

## Association
 belongs_to :user
 has_many :comments
 has_many :favorite
 

## comments テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| text          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| fishing       | references | null: false, foreign_key: true |


## Association
belongs_to :user
belongs_to :fishing

## favorites テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| fishing     | references | null: false, foreign_key: true |

## Association
belongs_to :user
belongs_to :fishing

# 開発環境
ruby/rails/html、css/