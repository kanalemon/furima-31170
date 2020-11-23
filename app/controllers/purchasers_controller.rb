class PurchasersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(purchaser_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def purchaser_params
    params.require(:order).permit(:post_cord, :prefecture_id, :city, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end
end
