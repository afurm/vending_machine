require_relative '../product/basic'
Dir[File.join(__dir__, '../product', '*.rb')].each { |file| require file }

describe 'Products' do
  context "Fanta" do
    before do
      Product::Factory.add(Product::Fanta.new, 3)
    end
    
    it 'has correct count' do
      expect(Product::Fanta.count).to be(3)
    end

    it 'has correct name' do
      expect(Product::Fanta::NAME).to eq("Fanta")
    end

    it 'has correct price' do
      expect(Product::Fanta::PRICE).to eq(2.70)
    end
  end

  context "CocaCola" do
    before do
      Product::Factory.add(Product::CocaCola.new, 2)
    end
    
    it 'has correct count' do
      expect(Product::CocaCola.count).to be(2)
    end

    it 'has correct name' do
      expect(Product::CocaCola::NAME).to eq("CocaCola")
    end

    it 'has correct price' do
      expect(Product::CocaCola::PRICE).to eq(2.00)
    end
  end

  context "OrangeJuice" do
    before do
      Product::Factory.add(Product::OrangeJuice.new, 1)
    end
    
    it 'has correct count' do
      expect(Product::OrangeJuice.count).to be(1)
    end

    it 'has correct name' do
      expect(Product::OrangeJuice::NAME).to eq("OrangeJuice")
    end

    it 'has correct price' do
      expect(Product::OrangeJuice::PRICE).to eq(3.00)
    end
  end

  context "Sprite" do
    before do
      Product::Factory.add(Product::Sprite.new, 2)
    end
    
    it 'has correct count' do
      expect(Product::Sprite.count).to be(2)
    end

    it 'has correct name' do
      expect(Product::Sprite::NAME).to eq("Sprite")
    end

    it 'has correct price' do
      expect(Product::Sprite::PRICE).to eq(2.50)
    end
  end

  context "Water" do
    before do
      Product::Factory.add(Product::Water.new, 0)
    end
    
    it 'has correct count' do
      expect(Product::Water.count).to be(0)
    end

    it 'has correct name' do
      expect(Product::Water::NAME).to eq("Water")
    end

    it 'has correct price' do
      expect(Product::Water::PRICE).to eq(3.25)
    end
  end
end