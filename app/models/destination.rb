class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture


  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/ 
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }



  validates :city,        presence: true
  validates :block,       presence: true
  validates :building
  validates :phone_number,    presence: true, format: {with: /\A\d{11}\z/}

  belongs_to :order 

end
