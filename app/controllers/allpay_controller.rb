require 'allpay'

class AllpayController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_trade

  def result
    if @trade.save
      redirect_to @trade.order, alert: '交易成功'
    else
      redirect_to @trade.order, alert: '交易失敗'
    end
  end

  def return
    if @trade.save
      render text: :'1|OK'
    else
      render text: :'0|ErrorMessage'
    end
  end

private

  def set_trade
    @trade = Trade.find_and_initialize_by_allpay(request.POST)
  end
end