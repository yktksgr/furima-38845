require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品情報入力' do
    context '商品情報入力成功時' do
      it '全ての値が正しく入力されていれば出品できること' do
        @item.category_id = 2
        @item.status_id = 2
        @item.shipping_cost_id = 2
        @item.prefecture_id = 2
        @item.shipping_date_id = 2
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力失敗時' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 0
        @item.valid?
      end
      it 'statusが未選択だと出品できない' do
        @item.status_id = 0
        @item.valid?
      end
      it 'shipping_costが未選択だと出品できない' do
        @item.shipping_cost_id = 0
        @item.valid?
      end
      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
      end
      it 'shipping_dateが未選択だと出品できない' do
        @item.shipping_date_id = 0
        @item.valid?
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end