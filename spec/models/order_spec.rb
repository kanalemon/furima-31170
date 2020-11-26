require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '寄付情報の保存' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '購入登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
    end

    context '購入登録がうまくいかないとき' do
      it 'post_cordが空だと保存できないこと' do
        @order.post_cord = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_cordが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.post_cord = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('郵便番号ハイフンを入力してください')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityは空では保存できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'building_nameは空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
      it 'phone_numberが空だと保存できないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが12桁だと保存できないこと' do
        @order.phone_number = '090000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では登録できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
