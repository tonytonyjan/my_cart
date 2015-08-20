class OrdersController < ApplicationController
  def show
    @order = Order.find params[:id]
  end

  def new
    @order = Order.new
  end

  def create
  end
end
