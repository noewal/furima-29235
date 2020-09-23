class FurimaApp

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :token,
                :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price, :user_id, :item_id

  with_options presence: true do
     validates :post_code
     validates :prefecture_id, numericality: { other_than: 1 }
     validates :city
     validates :address
     validates :phone_number
  end

# validates :building_name

  def save
     UserItem.create(user_id: user_id,items_id: item_id)

     Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,item_id: item_id)
  end

end 