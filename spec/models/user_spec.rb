require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'all required info is filled in' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testgmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'bizcliz4life'
        @user.password_confirmation = 'bizcliz5life'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'bc4lf'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordに数字がない場合' do
        @user.password = 'bizclizzlife'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは無効です。文字と数字を入力してください。')
      end
      it 'passwordに英文字がない場合' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは無効です。文字と数字を入力してください。')
      end
      it '半角英数字ではない場合' do
        @user.password = 'kkkk２２２'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは無効です。文字と数字を入力してください。')
      end
      it 'first nameがない場合' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前を入力してください")
      end
      it 'first nameが全角じゃない場合(english)' do
        @user.first_name = 'Thomas'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前は無効です。全角文字を入力してください。')
      end
      it 'first nameに数字がある場合' do
        @user.first_name = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前は無効です。全角文字を入力してください。')
      end
      it 'last nameがない場合' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it 'last nameが全角じゃない場合(english)' do
        @user.last_name = 'Thomas'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は無効です。全角文字を入力してください。')
      end
      it 'last nameに数字がある場合' do
        @user.last_name = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は無効です。全角文字を入力してください。')
      end
      it 'first name kana がない場合' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（カタカナ）を入力してください")
      end
      it 'first name kana が平仮名の場合' do
        @user.first_name_kana = 'りょう'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'first name kana が漢字の場合' do
        @user.first_name_kana = '量'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'first name kana がengの場合' do
        @user.first_name_kana = 'thomas'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'first name kana が数字の場合' do
        @user.first_name_kana = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'last name kana がない場合' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カタカナ）を入力してください")
      end
      it 'last name kana が平仮名の場合' do
        @user.last_name_kana = 'りょう'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'last name kana が漢字の場合' do
        @user.last_name_kana = '量'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'Last name kana がengの場合' do
        @user.last_name_kana = 'thomas'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'first name kana が数字の場合' do
        @user.last_name_kana = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（カタカナ）は無効です。全角カタカナ文字を入力してください。')
      end
      it 'birthdayがない場合' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
