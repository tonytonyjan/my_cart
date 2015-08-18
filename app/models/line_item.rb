class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :cart
  belongs_to :product

  def subtotal
    quantity * unit_price
  end
end
