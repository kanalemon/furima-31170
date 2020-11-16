require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品登録' do
      context '出品登録がうまくいくとき' do
        it '全ての値がが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品登録がうまくいかないとき' do
        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'nameが空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'descriptionが空だと登録できない' do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'categoryが空だと登録できない' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it 'statusが空だと登録できない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it 'postageが空だと登録できない' do
          @item.postage_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage can't be blank")
        end
        it 'prefectureが空だと登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'daysが空だと登録できない' do
          @item.days_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days can't be blank")
        end
        it 'priceが空だと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが¥300未満だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it 'priceが¥10,000,000以上だと登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
        it 'priceが全角数字だと登録できない' do
          @item.price = '１０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not included in the list')
        end
      end
    end
  end
end
