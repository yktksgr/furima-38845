require 'rails_helper'

RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
 end

  describe 'ユーザー新規登録' do
   context '新規登録の成功時' do
    it "nicknameとemail、passwordとpassword_confiramation,family_name,first_name,family_name_kana,first_name_kana,birth_dayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    
    it "passwordが6文字以上の半角英数字混合であれば登録できる" do
      @user.password = "000aaa"
      @user.password_confirmation = "000aaa"
      expect(@user).to be_valid
    end
    
    it "family_nameが全角文字であれば登録できる" do
      @user.family_name = "山田"
      expect(@user).to be_valid
    end
    
    it "first_nameが全角文字であれば登録できる" do
      @user.first_name = "陸太郎"
      expect(@user).to be_valid
    end
    
    it "family_name_kanaが全角カナであれば登録できる" do
      @user.family_name_kana = "ヤマダ"
      expect(@user).to be_valid
    end
    
    it "first_name_kanaが全角カナであれば登録できる" do
      @user.first_name_kana = "リクタロウ"
      expect(@user).to be_valid
    end
  end

  context '新規登録失敗時' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00aaa"
      @user.password_confirmation = "00aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "passwordは英数字混合でないと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   end
  end
end
 