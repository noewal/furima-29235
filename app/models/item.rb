class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :day,:delivery_cost, :prefecture, :status

  with_options presence: true do
    validates :name,          length: { maximum: 40 }
    validates :description,   length: { maximum: 1000 }
    validates :price,         numericality: { :greater_than_or_equal_to: 300 }, { :less_than_or_equal_to: 9999999 } 
  end

  with_options numericality: { other_than: 1 }
    validates:category_id,        presence: true
    validates:day_id,             presence: true
    validates:delivery_cost_id,   presence: true
    validates:prefecture_id,      presence: true
    validates:status_id,          presence: true
  end

  belongs_to :users
end
