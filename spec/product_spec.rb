require_relative '../product/factory'
Dir[File.join(__dir__, '../product', '*.rb')].each { |file| require file }

describe 'Products' do
  context "Fanta" do
    before do
      Product::Factory.build_fanta(3)
    end
    
    it 'has correct count' do
      expect(Product::Factory.items[:Fanta].count).to be(3)
    end

    it 'has correct name' do
      expect(Product::Factory.items[:Fanta].first.name).to eq("Fanta")
    end

    it 'has correct price' do
      expect(Product::Factory.items[:Fanta].first.price).to eq(2.70)
    end
  end

  context "CocaCola" do
    before do
      Product::Factory.build_coca_cola(2)
    end
    
    it 'has correct count' do
      expect(Product::Factory.items[:CocaCola].count).to be(2)
    end

    it 'has correct name' do
      expect(Product::Factory.items[:CocaCola].first.name).to eq("CocaCola")
    end

    it 'has correct price' do
      expect(Product::Factory.items[:CocaCola].first.price).to eq(2.00)
    end
  end

  context "OrangeJuice" do
    before do
      Product::Factory.build_orange_juice(1)
    end
    
    it 'has correct count' do
      expect(Product::Factory.items[:OrangeJuice].count).to be(1)
    end

    it 'has correct name' do
      expect(Product::Factory.items[:OrangeJuice].first.name).to eq("OrangeJuice")
    end

    it 'has correct price' do
      expect(Product::Factory.items[:OrangeJuice].first.price).to eq(3.00)
    end
  end

  context "Sprite" do
    before do
      Product::Factory.build_sprite(2)
    end
    
    it 'has correct count' do
      expect(Product::Factory.items[:Sprite].count).to be(2)
    end

    it 'has correct name' do
      expect(Product::Factory.items[:Sprite].first.name).to eq("Sprite")
    end

    it 'has correct price' do
      expect(Product::Factory.items[:Sprite].first.price).to eq(2.50)
    end
  end

  context "Water" do
    before do
      Product::Factory.build_water(1)
    end
    
    it 'has correct count' do
      expect(Product::Factory.items[:Water].count).to be(1)
    end

    it 'has correct name' do
      expect(Product::Factory.items[:Water].first.name).to eq("Water")
    end

    it 'has correct price' do
      expect(Product::Factory.items[:Water].first.price).to eq(3.25)
    end
  end
end