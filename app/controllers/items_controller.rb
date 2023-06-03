class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
  end

  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, :image)
  end

end
