class Trade < ActiveRecord::Base
  belongs_to :order
  serialize :params, JSON
  after_initialize :generate_trade_number, if: :new_record?

  def generate_trade_number
    self.trade_number = SecureRandom.hex(3)
  end

  def self.find_and_initialize_by_allpay params = {}
    trade = self.find_by(trade_number: params[:MerchantTradeNo])
    trade.paid = params['RtnCode'] == '1'
    trade.params = params
    trade
  end
end
