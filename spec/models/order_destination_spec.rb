require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end

  describe '商品の購入' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'credit card info が空だと保存できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("トークンを入力してください")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.postal_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('郵便番号が無効です。次のように入力してください (例 123-4567)')
      end
      it 'postal_codeがblankだと保存できない' do
        @order_destination.postal_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'phone number が空だと保存できない' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone number が数字以外では保存できない' do
        @order_destination.phone_number = 'asdfghj'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("電話番号が無効です。")
      end 
      it 'phone numberが9桁以下では購入できない' do
        @order_destination.phone_number = '0804647'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('電話番号が無効です。')
      end
      it 'phone numberが12桁以上では購入できない' do
        @order_destination.phone_number = '08046472222222'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include('電話番号が無効です。')
      end
      it 'cityが空だと保存できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'prefectureを選択しないと保存できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'blockが空だと保存できない' do
        @order_destination.block = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("番地を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
