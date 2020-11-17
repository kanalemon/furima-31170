class Item < ApplicationRecord
  belongs_to :user
  has_one :purchaser
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :prefecture_id
    validates :days_id
    validates :image
  end

  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
