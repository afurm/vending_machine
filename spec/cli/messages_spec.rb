require_relative "../../cli/messages.rb"

describe Messages do
  let(:instance) { Class.new { include Messages }.new }

  it 'should print product_found message' do
    expect(instance.product_found('Fanta')).to eq("Found product Fanta")
  end

  it 'should print higer_price message' do
    expect(instance.higer_price).to eq("Price is bigger than you insert")
  end

  it 'should print cannot_find message' do
    expect(instance.cannot_find).to eq("Product cannot be found")
  end

  it 'should print success message' do
    expect(instance.success({"name"=>"Fanta", "count"=>1, "price"=>2.7})).to eq("Here you go Fanta! Enjoy")
  end
end