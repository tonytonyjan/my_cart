class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, through: :line_items
  has_many :trades
  after_create :consume_stock

  def self.new_from_cart cart, params = {}
    order = self.new params
    order.line_items = cart.line_items
    order
  end

  def paid?
    trades.exists? paid: true
  end

  def total
    line_items.to_a.sum(&:subtotal)
  end

  private

  def consume_stock
    line_items.each do |line_item|
      line_item.product.decrement! :stock, line_item.quantity
    end
  end
end
