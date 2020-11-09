  #テーブル設計

  ## users テーブル

  | Column             | Type   | Options     |
  | ------------------ | ------ | ------------|
  | nickname           | string | null: false |
  | email              | string | null: false |
  | encrypted_password | string | null: false |
  | family_name        | string | null: false |
  | last_name          | string | null: false |
  | family_name_kana   | string | null: false |
  | last_name_kana     | string | null: false |
  | birthday           | date   | null: false |

  ### Association

  - has_many : items
  - has_many : purchasers

  ## items テーブル

  | Column       | Type       | Options                        |
  | ------------ | ---------- | ------------------------------ |
  | name         | string     | null: false                    |
  | description  | text       | null: false                    |
  | category_id  | integer    | null: false                    |
  | status_id    | integer    | null: false                    |
  | postage_id   | integer    | null: false                    |
  | prefecture_id| integer    | null: false                    |
  | days_id      | integer    | null: false                    |
  | price        | references | null: false, foreign_key: true |
  | users        | references | null: false, foreign_key: true |

  ### Association

  -belongs_to :users
  -has_one : purchaser
  -belongs_to :category
  -belongs_to :status
  -belongs_to :postage
  -belongs_to :prefecture
  -belongs_to :days

  ## addressesテーブル

  | Column           | Type       | Options                        |
  | ---------------- | ---------- | ------------------------------ |  
  | post_cord        | string     | null: false                    |
  | prefecture_id    | integer    | null: false                    |
  | city             | string     | null: false                    |
  | address1         | string     | null: false                    |
  | address2         | string     | null: false                    |
  | building_name    | string     |                                |
  | phone_number     | string     | null: false                    |
  | purchaser        | references | null: false, foreign_key: true |

  ### Association

  -belongs_to : purchaser
  -belongs_to : prefecture

  ## purchasers テーブル

  | Colum    | Type       | Options                       |
  | -------- | ---------- | ----------------------------- |
  | items    | references |null: false, foreign_key: true |
  | users    | references |null: false, foreign_key: true |

  ### Association

  -belongs_to : user
  -belongs_to : item
  -has_one : address
