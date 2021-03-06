class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_useritem, only: [:index, :show]
  
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      authenticate_user!
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
     if @item.update(item_params)
       redirect_to item_path(@item.id)
     else
       render :edit
     end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,
    :price,:category_id,:status_id,:prefecture_id,:delivery_cost_id,:day_id).merge(user_id: current_user.id)
    
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_useritem
    @useritems = Useritem.all
  end
end
