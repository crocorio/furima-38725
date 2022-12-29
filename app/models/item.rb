class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_date

  belongs_to :user
  has_one :order 

  has_one_attached :image

  validates :price, numericality: { with: /\A[0-9]+\z/, only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_cost_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
end
