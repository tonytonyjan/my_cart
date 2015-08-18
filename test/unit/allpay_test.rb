require 'test_helper'
require 'allpay'
 
class AllpayTest < ActiveSupport::TestCase
  test '#make_make' do
    allpay = Allpay.new merchant_id: '12345678', hash_key: 'xdfaefasdfasdfa32d', hash_iv: 'sdfxfafaeafwexfe'
    mac = allpay.make_mac(
      ItemName: 'sdfasdfa',
      MerchantID: '12345678',
      MerchantTradeDate: '2013/03/12 15:30:23',
      MerchantTradeNo: 'allpay_1234',
      PaymentType: 'allpay',
      ReturnURL: 'http:sdfasdfa',
      TotalAmount: '500',
      TradeDesc: 'dafsdfaff'
    )

    assert_equal '40D9A6C00A4A78A300ED458237071BDA', mac
  end

  test '#check_mac' do
    allpay = Allpay.new
    assert allpay.check_mac RtnCode: '1',
      PaymentType: 'Credit_CreditCard',
      TradeAmt: '700',
      PaymentTypeChargeFee: '14',
      PaymentDate: '2015/02/07 14:21:00',
      SimulatePaid: '0',
      CheckMacValue: '3AF270CCCFA58CA0349F4FD462E21643',
      TradeDate: '2015/02/07 14:20:47',
      MerchantID: '2000132',
      TradeNo: '1502071420478656',
      RtnMsg: '交易成功',
      MerchantTradeNo: '355313'
  end
end