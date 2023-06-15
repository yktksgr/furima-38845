require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @purchase_form.user_id = 1
        expect(@purchase_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @purchase_form.item_id = 1
        expect(@purchase_form).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
        @purchase_form.postcode = '123-4567'
        expect(@purchase_form).to be_valid
      end
      it '都道府県が未選択でなければ保存できる' do
        @purchase_form.prefecture_id = 2
        expect(@purchase_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @purchase_form.city = '伊予市'
        expect(@purchase_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @purchase_form.address = '青山区１２３'
        expect(@purchase_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchase_form.building_name = nil
        expect(@purchase_form).to be_valid
      end
      it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
        @purchase_form.phone_number = 12_345_678_910
        expect(@purchase_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_form.item_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @purchase_form.postcode = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postcode can't be blank", 'Postcode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @purchase_form.postcode = 1_234_567
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が未選択だと保存できないこと' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_form.address = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_form.phone_number = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @purchase_form.phone_number = '123-4567-8900'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid. Include hyphen(-)')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @purchase_form.phone_number = 12345678910123
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid. Include hyphen(-)')
      end
      it "tokenが空では登録できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
