require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test '#total' do
    assert_equal 3250, carts(:one).total
  end
end
