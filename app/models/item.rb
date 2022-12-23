class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :condition 
  belongs_to :prefecture
  belongs_to :shipping_cost 
  belongs_to :shipping_date 


  belongs_to :user 

  has_one_attached :image


  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :image, presence: true


  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }  


end
