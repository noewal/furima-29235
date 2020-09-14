## users_table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kane|string|null: false|
|birthday_year|date|null: false|
|birthday_month|date|null: false|
|birthday_day|date|null: false|

### Association
- has_many :items
- has_many :comments
- belongs_to :card
- belongs_to :address


## items_table
|Column|Type|Options|
|------|----|-------|
|image|references|null: false|
|item_name|string|null: false|
|description|text|null: false|
|category_id|references|null: false|
|status|references|null: false|
|cost|integer|null: false|
|prefecture_id|integer|null: false|
|day|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_many :comments
- belongs_to :category

## address_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_cord|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|integer|null: false|

### Association
- belongs_to :user

## card_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|security_cord|integer|null: false|

### Association
- belongs_to :user

## comments_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comments|text|

### Association
- belongs_to :user
- belongs_to :items


## category_table
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items
