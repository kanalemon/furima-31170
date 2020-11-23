class PurchasersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if @item.purchaser != nil
      redirect_to root_path
    elsif current_user.id != @item.user_id
      @order = Order.new
    else
      redirect_to root_path
    end
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
