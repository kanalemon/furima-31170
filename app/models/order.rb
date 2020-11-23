class Order
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_cord, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :token
  end

  validates :post_cord, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, presence: true, format: { with:/\A\d{10}$|^\d{11}\z/}

  def save
    purchaser = Purchaser.create!(item_id: item_id, user_id: user_id)
    Address.create!(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id )
  end
end