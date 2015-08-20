class OrdersController < ApplicationController
  def show
    @order = Order.find params[:id]
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new_from_cart(current_cart, order_params)
    if @order.save
      current_cart.clear
      redirect_to @order
    else
      render :new
    end
  end

private

  def order_params
    params.require(:order).permit(:name, :address, :payment_method)
  end
end
