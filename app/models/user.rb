class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders 

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は無効です。文字と数字を入力してください。'

  with_options presence: true,
               format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は無効です。全角文字を入力してください。' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true,
               format: { with: /\A[ァ-ヶ一]+\z/, message: 'は無効です。全角カタカナ文字を入力してください。' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
