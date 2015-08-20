require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test '::new_from_cart' do
    order = Order.new_from_cart carts(:one)
    assert_equal carts(:one).line_item_ids.sort, order.line_item_ids.sort
  end

  test '#total' do
    assert_equal 3250, carts(:one).total
  end

  test '#paid?' do
    assert orders(:paid_order).paid?
    refute orders(:unpaid_order).paid?
  end
end
