# README
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
