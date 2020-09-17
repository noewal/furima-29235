require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報の登録' do
    
    before do
       @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいく時' do
      it 'nickname,email,password,password_confirmation,
      family_name_full_width,first_name_full_width,family_name_kana_input,
      first_name_kana_input,birthdayが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'emailは@を含めば登録できる' do
        @user.email = "test@mail.com"
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end

      it 'family_nameとfirst_nameが全角であれば登録できる' do
        @user.family_name = "山田"
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end

      it 'family_name_kanaとfirst_name_kanaが全角カタカナ入力であれば登録できる' do
        @user.family_name_kana = "ヤマダ"
        @user.first_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが一意性でないと登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていないと登録できないこと" do
        @user.email = "testmailcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以下では登録できないこと" do
        @user.password = "passw"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "passwordは半角英数字混合でないと登録できないこと" do
        @user.password = "passwor1d"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = nil
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "family_nameとfirst_nameが両方存在しないと登録できないこと" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters.")
      end

      it "family_nameとfirst_nameは全角でないと登録できないこと" do
        @user.family_name = "ｙａｍａｄａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end

      it "family_name_kanaとfirst_name_kanaが両方存在しないと登録できないこと" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "family_name_kana_inputとfirst_name_kana_inputは全角(カタカナ)でないと登録できないこと" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it "birthdayが空では登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end