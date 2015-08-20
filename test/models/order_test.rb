require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test '#total' do
    assert_equal 3250, carts(:one).total
  end

  test '#paid?' do
    assert orders(:paid_order).paid?
    refute orders(:unpaid_order).paid?
  end
end
