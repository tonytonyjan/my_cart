class Trade < ActiveRecord::Base
  belongs_to :order
  serialize :params, JSON

  after_initialize :generate_trade_number, if: :new_record?

  def generate_trade_number
    self.trade_number = SecureRandom.hex(3)
  end
end
