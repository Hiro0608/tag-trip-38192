## DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
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

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| tweet       | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user

## sns_credentials table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| provider           | string              | null: false                    |
| uid                | string              | null: false                    |
| user               | references          | null: false, foreign_key: true |

### Association

- belongs_to :user