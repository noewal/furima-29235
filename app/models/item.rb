class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :address
  has_many :user_items
  has_many :users, through: :user_items

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  with_options presence: true do
    validates :image
    validates :name,          length: { maximum: 40 }
    validates :description,   length: { maximum: 1000 }
    validates :price,         numericality: { greater_than_or_equal_to: 300 }
    validates :price,         numericality: { less_than_or_equal_to: 9999999 } 
  end

  with_options numericality: { other_than: 1},presence:true do
    validates:category_id
    validates:day_id
    validates:delivery_cost_id
    validates:prefecture_id
    validates:status_id
  end

  
end
