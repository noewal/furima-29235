require 'rails_helper'

 RSpec.describe FurimaApp, type: :model do
   describe '商品購入結果の保存' do
     before do
       @furima_app = FactoryBot.build(:furima_app)
     end
     context '商品購入結果が保存出来る時' do
       it '全ての値が正しく入力されれば保存出来ること' do
         expect(@furima_app).to be_valid
       end

     end

     context '商品購入結果が保存出来ない時' do
       it 'post_codeが空では保存できないこと' do
         @furima_app.post_code = nil
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("Post code can't be blank")
       end

       it 'post_codeにハイフンが無ければ保存できないこと' do
         @furima_app.post_code = 1234567
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
       end

       it 'prefecture_idが1の値では保存できないこと' do
         @furima_app.prefecture_id = 1
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("Prefecture must be other than 1")
       end

       it 'cityが空では保存できないこと' do
         @furima_app.city = nil
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("City can't be blank")
       end

       it 'addressが空では保存できないこと' do
         @furima_app.address = nil
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("Address can't be blank")
       end

       it 'phone_numberが空では保存できないこと' do
         @furima_app.phone_number = nil
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("Phone number can't be blank")
       end

       it 'phone_numberが12桁以上では保存できないこと' do
         @furima_app.phone_number = 123456789012
         @furima_app.valid?
         expect(@furima_app.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
       end

       it 'tokenが空では保存できないこと' do
        @furima_app.token = nil
        @furima_app.valid?
        expect(@furima_app.errors.full_messages).to include("Token can't be blank")
      end

     end

   end
 end
