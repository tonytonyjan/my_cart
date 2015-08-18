require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test '#total' do
    assert_equal 3250, carts(:one).total
  end

  test '#empty?' do
    refute carts(:one).empty?
    assert carts(:two).empty?
  end

  test '#clear' do
    refute carts(:one).empty?
    carts(:one).clear
    assert carts(:one).empty?
  end
end
