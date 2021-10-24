require 'json'

module FileOperation
  def write(product_obj)
    File.open("machine.json","w") do |f|
      f.write(product_obj.to_json)
    end
  end

  def read
    JSON.parse(File.read("machine.json"))
  end
end