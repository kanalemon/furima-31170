class Item < ApplicationRecord
  belongs_to :users
  has_one :purchaser
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days
  has_one_attached :image
end
