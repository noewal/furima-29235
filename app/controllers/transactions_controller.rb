class TransactionsController < ApplicationController
  def index
    if user_signed_in?
      @item = Item.find(params[:item_id])
      if current_user.id == @item.user.id && @item.useritem != nil
        redirect_to root_path
      end
    else
      authenticate_user!
    end
  end

  def create
    @item = FurimaApp.new(item_params)
    if @item.valid?
      pay_item
      @item.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def item_params
    params.permit(:token,
      :post_code, :prefecture_id, :city, :address, :address, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: item_params[:token],
      currency:'jpy'
    )
  end

end
