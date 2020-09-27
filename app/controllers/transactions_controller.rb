class TransactionsController < ApplicationController
  def index
    if user_signed_in?
      @order = FurimaApp.new(order_params)
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user.id || @item.useritem != nil
        redirect_to root_path
      end
    else
      authenticate_user!
    end
  end

  def create
    @order = FurimaApp.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token,
      :post_code, :prefecture_id, :city, :address, :address, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
