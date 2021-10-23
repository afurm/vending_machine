module Product
  class Basic
    def add
      self.class.items << self
    end

    def self.count
      items.size
    end

    def self.items
      @items
    end
  end
end