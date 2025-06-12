require_relative 'basket'

catalog = Catalog.new([
  Product.new('R01', 'Red Widget', 32.95),
  Product.new('G01', 'Green Widget', 24.95),
  Product.new('B01', 'Blue Widget', 7.95),
])

delivery_rule = DeliveryRule.new([
  [50.0, 4.95],
  [90.0, 2.95],
])

offers = [BuyOneRedWidgetSecondHalf.new]

basket = Basket.new(catalog: catalog, delivery_rule: delivery_rule, offers: offers)

['B01', 'G01'].each { |code| basket.add(code) }
puts "'B01' 'G01' : #{basket.total}"

basket = Basket.new(catalog: catalog, delivery_rule: delivery_rule, offers: offers)
['R01', 'R01'].each { |code| basket.add(code) }
puts "'R01' 'R01' : #{basket.total}"

basket = Basket.new(catalog: catalog, delivery_rule: delivery_rule, offers: offers)
['R01', 'G01'].each { |code| basket.add(code) }
puts "'R01' 'G01' : #{basket.total}"

basket = Basket.new(catalog: catalog, delivery_rule: delivery_rule, offers: offers)
['B01', 'B01', 'R01', 'R01', 'R01'].each { |code| basket.add(code) }
puts "'B01' 'B01' 'R01' 'R01' 'R01' : #{basket.total}"






