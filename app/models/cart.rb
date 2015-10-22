class Cart < ActiveRecord::Base
  has_many :line_items
  accepts_nested_attributes_for :line_items
  delegate :empty?, :clear, to: :line_items
  validates_associated :line_items

  def total
    line_items.to_a.sum(&:subtotal)
  end
end
