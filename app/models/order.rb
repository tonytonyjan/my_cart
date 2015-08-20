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

  def total
    line_items.to_a.sum(&:subtotal)
  end

  def paid?
    trades.exists? paid: true
  end

private

  def consume_stock
    line_items.each do |line_item|
      line_item.product.stock -= line_item.quantity
      line_item.product.save!
    end
  end

end
