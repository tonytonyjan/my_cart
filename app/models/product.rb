class Product < ActiveRecord::Base
  has_many :line_items
  validates :stock, numericality: {greater_than_or_equal_to: 0}
end
