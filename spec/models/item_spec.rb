require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do

    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品が出来る時' do
      it 'name,description,price,
      category_id,status_id,delivery_cost_id,prefecture_id,day_id,price,user_idが全て存在すれば商品出品が出来る' do
        expect(@item).to be_valid
      end

      it 'nameが40文字以内であれば商品出品が出来る' do
        @item.name = "aaaaaaaaabbbbbbbbbbccccccccccdddddddddd"
        expect(@item).to be_valid
      end

      it 'priceが300以上であれば商品出品が出来る' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが9999999以下であれば商品出品ができる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品出品が出来ない時' do
      it 'nameが空では商品出品が出来ない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40文字を超えると商品出品が出来ない' do
        @item.name = "aaaaaaaaabbbbbbbbbbccccccccccddddddddddeee"
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it 'descriptionが空では商品出品が出来ない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1000文字を超えると商品出品が出来ない' do
        @item.description = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
        aaaaaaaaaaaaaaaaaaaaaaaab"
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end

      it 'category_idの値が１(空)では商品出品が出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'status_idの値が１(空)では商品出品が出来ない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it 'delivery_cost_idの値が１(空)では商品出品が出来ない' do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 1")
      end

      it 'prefecture_idの値が１(空)では商品出品が出来ない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'day_idの値が１(空)では商品出品が出来ない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it 'priceが空では商品出品が出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceの値が300未満だと商品出品が出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceの値が9999999を超えると商品出品が出来ない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
