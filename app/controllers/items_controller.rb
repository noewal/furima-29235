class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")

  end

  def show
    @item = Item.find(params[:id])
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(paramas[:id])
    item.update(item_params)
  end


  private

  def item_params
    params.require(:item).permit(:image,:name,:description,
    :price,:category_id,:status_id,:prefecture_id,:delivery_cost_id,:day_id).merge(user_id: current_user.id)
    
  end
  
end
