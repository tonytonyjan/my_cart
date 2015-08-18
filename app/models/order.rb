class Order < ActiveRecord::Base
  has_many :line_items
  has_many :products, through: :line_items

  def total
    line_items.to_a.sum(&:subtotal)
  end
end
