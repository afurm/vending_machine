module Messages
  def print_list_of_products(&block)
    p "Name   price   count"
    %w(Fanta CocaCola OrangeJuice Sprite Water).each do |product|
      prod = Object.const_get("Product::#{product}")
      p "#{prod::NAME} => #{prod::PRICE} => #{prod.count}"
      block.call(prod)
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