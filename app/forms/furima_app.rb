class FurimaApp

  include ActiveModel::Model
  attr_accessor :number, :exp_month, :exp_year, :cvc, :token,
                :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :price, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
  end


  def save
     Useritem.create(user_id: user_id,item_id: item_id)

     Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name,phone_number: phone_number,item_id: item_id)
  end

end 