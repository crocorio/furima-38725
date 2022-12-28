class OrderDestination 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :order_id



  with_options presence: true do
  validates :user_id
  validates :item_id

  validates :city
  validates :block
  
  validates :phone_number, format: {with: /\A\d{11}\z/}

  
  validates :postal_code,  format: { with: /\A\d{3}[-]?\d{4}\z/  }

  
  end 

  validates :prefecture, numericality: {other_than: 1, message: "can't be blank"}

  validate :building


  def save
    
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order_id)
  end

end
