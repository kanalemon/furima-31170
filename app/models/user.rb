class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :birthday, presence: true

      with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do 
         validates :family_name, presence: true
         validates :last_name, presence: true
      end
      with_options presence: true, format: { with: /\A[ァ-ン]+\z/} do
         validates :family_name_kana, presence: true
         validates :last_name_kana, presence: true
      end

      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates_format_of :password, with: PASSWORD_REGEX
end
