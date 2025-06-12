

Product = Struct.new(:code, :name, :price)

class Catalog
  def initialize(products)
    @products = products.each_with_object({}) { |p, hash| hash[p.code] = p }
  end

  def find(code)
    @products[code]
  end
end

class DeliveryRule
  def initialize(rules)
    @rules = rules.sort_by { |amount, _| amount }
  end

  def calculate(subtotal)
    @rules.each do |amount, charge|
      return charge if subtotal < amount
    end
    0.0
  end
end

class Offer
  def apply(products)
    0.0
  end
end

class BuyOneRedWidgetSecondHalf < Offer
  def apply(products)
    red_widgets = products.select { |p| p.code == 'R01' }
    discount = 0.0
    red_widgets.each_slice(2) do |pair|
      if pair.size == 2
        discount += pair[1].price / 2.0
      end
    end
    discount
  end
end

class Basket
  def initialize(catalog:, delivery_rule:, offers: [])
    @catalog = catalog
    @delivery_rule = delivery_rule
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @catalog.find(product_code)
    raise "Invalid product code: #{product_code}" unless product
    @items << product
  end

  def total
    subtotal = @items.sum(&:price)
    discount = @offers.sum { |offer| offer.apply(@items) }
    delivery = @delivery_rule.calculate(subtotal - discount)
    total = subtotal - discount + delivery
    format("$%.2f", total.floor(2))
  end
end


