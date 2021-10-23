module Product
  class Factory
    def self.add(product, n)
      n.times { product.add }
    end
  end
end