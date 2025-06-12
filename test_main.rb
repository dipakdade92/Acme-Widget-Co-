# test_basket.rb
require 'minitest/autorun'
require_relative 'main'

class BasketTest < Minitest::Test
  def setup
    @catalog = Catalog.new([
      Product.new('R01', 'Red Widget', 32.95),
      Product.new('G01', 'Green Widget', 24.95),
      Product.new('B01', 'Blue Widget', 7.95),
    ])

    @delivery_rule = DeliveryRule.new([
      [50.0, 4.95],
      [90.0, 2.95],
    ])

    @offers = [BuyOneRedWidgetSecondHalf.new]
  end

  def test_basket_b01_g01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    ['B01', 'G01'].each { |code| basket.add(code) }
    assert_equal "$37.85", basket.total
  end

  def test_basket_r01_r01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    ['R01', 'R01'].each { |code| basket.add(code) }
    assert_equal "$54.37", basket.total
  end

  def test_basket_r01_g01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    ['R01', 'G01'].each { |code| basket.add(code) }
    assert_equal "$60.85", basket.total
  end

  def test_basket_b01_b01_r01_r01_r01
    basket = Basket.new(catalog: @catalog, delivery_rule: @delivery_rule, offers: @offers)
    ['B01', 'B01', 'R01', 'R01', 'R01'].each { |code| basket.add(code) }
    assert_equal "$98.27", basket.total
  end
end
