class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: :index 



  def index
    @order_destination = OrderDestination.new
  end

  def create
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
