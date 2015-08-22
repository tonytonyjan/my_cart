class Cart < ActiveRecord::Base
  has_many :line_items
  delegate :empty?, :clear, to: :line_items

  def total
    line_items.to_a.sum(&:subtotal)
  end
end
