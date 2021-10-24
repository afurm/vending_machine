require_relative 'file_operation'
require_relative 'messages'

module Manager
  include FileOperation
  include Messages

  def find_product(product_name, amount)
    product_obj = read["products"]
    updated_coins = read["coins"]
    product_to_buy = ''
    change = 0.00

    updated_products = product_obj.map do |item|
      if item["name"] === product_name
        if item["count"] > 0 
           product_found product_name
        else
          break
        end
        if item["price"] <= amount.to_f
          change, updated_coins = calculate_coins(amount.to_f - item["price"])
          product_to_buy = item
          item["count"]-=1
        else
          higer_price
        end
      end
      item
    end
    
    return [product_to_buy, change, updated_products, updated_coins]
  end


  def calculate_coins(amount)
    coins_obj = read["coins"]
    change = 0.0

    updated_coins = coins_obj.map do |coin|
      count = coin["count"]
      coin['count'].times do
        if amount >= coin["value"]
          amount -= coin["value"]
          change += coin["value"]
          count -= 1
        end
      end 

      { value: coin["value"], count: count }
    end

    return [change, updated_coins]
  end
end