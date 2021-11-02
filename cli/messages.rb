module Messages
  def print_list_of_products(&block)
    p "Name   price   count"

    Product::Factory.items.each do |key, value|
      p "#{key} => #{value.first&.price} => #{value.count}"
      block.call({ name: key, value: value})
    end
  end

  def product_found(name)
    p "Found product #{name}"
  end

  def higer_price
    p "Price is bigger than you insert"
  end

  def cannot_find
    p "Product cannot be found"
  end

  def success(product_to_buy, change)
    p "Here you go #{product_to_buy["name"]} (change -> #{change})! Enjoy"
  end
end