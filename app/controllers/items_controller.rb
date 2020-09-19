class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")

  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,
    :price,:category_id,:status_id,:prefecture_id,:delivery_cost_id,:day_id).merge(user_id: current_user.id)
    
  end
  
end
