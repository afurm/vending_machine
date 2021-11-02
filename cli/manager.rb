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

    normalized = product_obj.is_a?(Hash) ? normalize(product_obj) : product_obj

    updated_products = normalized.map do |item|
      is_product_exist?(item, product_name) do
        break if is_count_less_zero? item["count"]
        product_found product_name
        
        is_price_lower_or_eq?(item, amount) do
          change, updated_coins = calculate_coins(amount.to_f - item["price"])
          product_to_buy = item
          item["count"]-=1
        end
      end

      item
    end
    
    [product_to_buy, change, updated_products, updated_coins]
  end

  
  def calculate_coins(amount)
    coins_obj = read["coins"]
    change = 0.0

    updated_coins = coins_obj.map do |coin|
      count = coin["count"]
      
      coin['count'].times do
        next unless amount >= coin["value"]
        amount -= coin["value"]
        change += coin["value"]
        count -= 1
      end 

      { value: coin["value"], count: count }
    end

    [change, updated_coins]
  end


  private
  def is_count_less_zero?(count)
    count <= 0
  end

  def is_price_lower_or_eq?(item, amount, &block)
    item["price"] <= amount.to_f ? block.call : higer_price
  end


  def is_product_exist?(item, product_name, &block)
    item["name"] === product_name ? block.call : item
  end

  def normalize(product_obj)
    product_obj.map do |k, value|
      { "name" => k, "count" => value["count"], "price" => value["price"]}
    end
  end
end