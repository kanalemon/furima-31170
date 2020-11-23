FactoryBot.define do
  factory :order do
    post_cord { '123-4567' }
    prefecture_id { 1 }
    city { '福岡市' }
    address { '111' }
    building_name { '福岡ハイツ' }
    phone_number { '09000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
