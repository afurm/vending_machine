module Product
  class Factory
    attr_reader :name, :price
    
    @items = { "CocaCola": [],
               "Fanta": [],
               "OrangeJuice": [],
               "Sprite": [],
               "Water": [] }

    def initialize(name, price)
      @name = name
      @price = price
      add
    end

    private_class_method :new

    def add
      self.class.items[self.name.to_sym] << self
    end

    def self.items
      @items
    end

    def self.build_coca_cola(count)
      count.times { new('CocaCola', 2.00) }
    end

    def self.build_fanta(count)
      count.times { new('Fanta', 2.70) }
    end

    def self.build_orange_juice(count)
      count.times { new('OrangeJuice', 3.00) }
    end

    def self.build_sprite(count)
      count.times { new('Sprite', 2.50) }
    end

    def self.build_water(count)
      count.times { new('Water', 3.25) }
    end
  end
end