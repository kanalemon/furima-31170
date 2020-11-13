FactoryBot.define do
  factory :user do
    nickname              { 'yamada' }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    family_name           { '山田' }
    last_name             { '太郎' }
    family_name_kana      { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '2020-01-01' }
  end
end
