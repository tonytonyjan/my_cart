class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[update destroy]

  def create
    @line_item = current_cart.line_items.new line_item_params
    if @line_item.save
      redirect_to cart_path, notice: '更新成功'
    else
      redirect_to @line_item.product, alert: '更新失敗'
    end
  end

  def update
    if @line_item.update line_item_params
      redirect_to cart_path, notice: '更新成功'
    else
      redirect_to cart_path, alert: '更新失敗'
    end
  end

  def destroy
    @line_item.destroy
    redirect_to cart_path
  end

private

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end

  def set_line_item
    @line_item = LineItem.find params[:id]
  end
end