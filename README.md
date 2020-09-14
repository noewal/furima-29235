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
|birthday|date|null: false|

### Association
- has_many :items
- has_many :comments
- has_many :user_items



## items_table
|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|cost|integer|null: false|
|prefecture_id|integer|null: false|
|day|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :comments
- has_one :user_item

## user_item_table
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address_table
|Column|Type|Options|
|------|----|-------|
|user_item_id|integer|null: false, foreign_key: true|
|post_cord|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|null: false|

### Association
- belongs_to :user_item

## comments_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comments|text|

### Association
- belongs_to :user_item
- belongs_to :items

