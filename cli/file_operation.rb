module FileOperation
  def write(product_obj)
    File.open("products.json","w") do |f|
      f.write(product_obj.to_json)
    end
  end

  def read
    JSON.parse(File.read("products.json"))
  end
end