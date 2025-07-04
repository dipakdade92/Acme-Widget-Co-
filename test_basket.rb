# test_basket.rb
require 'minitest/autorun'
require_relative 'basket'

class BasketTest < Minitest::Test
  def setup
    @catalog = Catalog.new([
      Product.new('R01', 'Red Widget', 32.95),
      Product.new('G01', 'Green Widget', 24.95),
      Product.new('B01', 'Blue Widget', 7.95),
    ])

    @delivery_rule = DeliveryRule.new([
      [50.0, 4.95],
      [90.0, 2.95]
    ])

    @offers = [BuyOneRedWidgetSecondHalf.new]
  end

  def test_basket_with_b01_and_g01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    basket.add("B01")
    basket.add("G01")
    assert_equal "$37.85", basket.total
  end

  def test_basket_with_two_r01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    basket.add("R01")
    basket.add("R01")
    assert_equal "$54.37", basket.total
  end

  def test_basket_with_r01_and_g01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    basket.add("R01")
    basket.add("G01")
    assert_equal "$60.85", basket.total
  end

  def test_basket_with_multiple_items
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    ['B01', 'B01', 'R01', 'R01', 'R01'].each { |code| basket.add(code) }
    assert_equal "$98.27", basket.total
  end

  def test_invalid_product_code
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    assert_raises(RuntimeError) { basket.add("Z99") }
  end
end
