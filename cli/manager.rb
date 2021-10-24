require_relative 'file_operation'
require_relative 'messages'

module Manager
  include FileOperation
  include Messages

  def find_product(product_name, amount)
    product_obj = read
    product_to_buy = ''

    updated_products = product_obj.map do |item|
      if item["name"] === product_name && item["count"] > 0
        product_found product_name
        if item["price"] <= amount.to_f
          product_to_buy = item
          item["count"]-=1
        else
          higer_price
        end
      end
      item
    end
    
    return [product_to_buy, updated_products]
  end
end