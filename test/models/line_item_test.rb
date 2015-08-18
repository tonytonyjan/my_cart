require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  test '#subtotal' do
    assert_equal 750, line_items(:one).subtotal
    assert_equal 2500, line_items(:two).subtotal
  end
end
