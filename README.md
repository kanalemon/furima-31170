#テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ------------|
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| birth_year       | string | null: false |
| birth_month      | string | null: false |
| birth_day        | string | null: false |

### Association

- has_many : items
- has_many : purchaser
- has_one : card

## items テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ------------|
| image        | string | null: false |
| name         | string | null: false |
| description  | string | null: false |
| category     | string | null: false |
| status       | string | null: false |
| postage      | string | null: false |
| prefecture   | string | null: false |
| birth_year   | string | null: false |
| birth_month  | string | null: false |
| birth_day    | string | null: false |

### Association

-belongs_to :users
-has_one : purchaser

## purchaserテーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ------------|
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| post_cord        | string | null: false |
| prefecture       | string | null: false |
| city             | string | null: false |
| address1         | string | null: false |
| address2         | string | null: false |
| building_name    | string | null: false |
| phone_number     | string | null: false |
| users_id         | string | null: false |
| item             | string | null: false |

### Association

-belongs_to : users
-belongs_to : items

## cardテーブル

| Column    | Type   | Options     |
| --------- | ------ | ------------|
| users_id  | string | null: false |
| card_id   | string | null: false |

### Association

-belongs_to : users