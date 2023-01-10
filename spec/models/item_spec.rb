require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報保存' do
    context '商品の情報を保存できる時' do
      it 'all required info is filled in' do
        expect(@item).to be_valid
      end
    end
    context '商品情報を保存できない場合' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("名前を入力してください")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("詳細を入力してください")
      end
      it 'categoryが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリを入力してください。")
      end
      it 'conditionが空では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("状態を入力してください。")
      end
      it 'shipping costが空では登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください。")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください。")
      end
      it 'shipping dateが空では登録できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください。")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが全角では登録できない' do
        @item.price = '３５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が無効です。半角文字を入力してください。')
      end
      it 'priceが300未満では登録できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です。')
      end
      it 'priceが9999999以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が範囲外です。')
      end
      it 'imageがないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
