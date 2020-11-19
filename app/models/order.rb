class UserDonation
  include ActiveModel::Model
  attr_accessor :item, :user :post_cord, :prefecture_id, :city, :address, :building_name, :phone_number, :purchaser

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :address
  end

  validates :post_cord, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, presence: true, format: { with:/\A\d{10}$|^\d{11}\z/}

  def save
    # 住所の情報を保存
    Address.create(post_cord: post_cord, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchaser_id: purchaser_id )
    # 寄付金の情報を保存
    Purchaser.create(item_id: item_id, user_id: user.id)
  end
end