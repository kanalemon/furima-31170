class Order
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_cord, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser_id

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
    validates :item_id
    validates :user_id
  end

  validates :post_cord, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, presence: true, format: { with:/\A\d{10}$|^\d{11}\z/}

  def save
    purchaser = Purchaser.create!(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create!(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser.id )
    
  end
end