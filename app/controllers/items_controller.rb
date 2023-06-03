class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: "商品を出品しました。"
    else
      redirect_to new_item_path,flash: { error: @item.errors.full_messages }
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price, :image)
  end

end
