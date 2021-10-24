require_relative "../../cli/manager.rb"

describe Manager do
  let(:instance) { Class.new { include Manager }.new }

  it 'should find correct product' do
    instance.stub(:read) {   { "products" => [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25} ], "coins" => [] }}

    expect(instance.find_product("Fanta", 2.7)).to eq([{"name"=>"Fanta", "count"=>1, "price"=>2.7}, 0.00,
                                                       [ 
                                                         {"name"=>"Fanta", "count"=>1, "price"=>2.7},
                                                         {"name"=>"CocaCola", "count"=>2, "price"=>2.0},
                                                         {"name"=>"OrangeJuice", "count"=>1, "price"=>3.0},
                                                         {"name"=>"Sprite", "count"=>2, "price"=>2.5},
                                                         {"name"=>"Water", "count"=>0, "price"=>3.25}],[]
                                                        ])
  end


  it 'should not find correct product if amount is less' do
    instance.stub(:read) { { "products" => [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25}], "coins" => [] }}

    expect(instance.find_product("Fanta", 2.6)).to eq(["", 0.00,
                                                       [ 
                                                         {"name"=>"Fanta", "count"=>2, "price"=>2.7},
                                                         {"name"=>"CocaCola", "count"=>2, "price"=>2.0},
                                                         {"name"=>"OrangeJuice", "count"=>1, "price"=>3.0},
                                                         {"name"=>"Sprite", "count"=>2, "price"=>2.5},
                                                         {"name"=>"Water", "count"=>0, "price"=>3.25}],[]
                                                        ])
  end

  it 'should not find correct product if name is incorrect' do
    instance.stub(:read) { { "products" => [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25}], "coins" => []} }
                             
    expect(instance.find_product("FakeFanta", 2.7)).to eq(["", 0.00,
                                                       [ 
                                                         {"name"=>"Fanta", "count"=>2, "price"=>2.7},
                                                         {"name"=>"CocaCola", "count"=>2, "price"=>2.0},
                                                         {"name"=>"OrangeJuice", "count"=>1, "price"=>3.0},
                                                         {"name"=>"Sprite", "count"=>2, "price"=>2.5},
                                                         {"name"=>"Water", "count"=>0, "price"=>3.25}],[]
                                                        ])
  end

  it 'should return correct amount' do
    instance.stub(:read) { { "products" => [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25}], 
                             "coins" => [ {"value" => 5.0,"count" => 5},
                                        {"value" => 3.0,"count" => 5},
                                        {"value" => 2.0,"count" => 5},
                                        {"value" => 1.0,"count" => 5},
                                        {"value" => 0.5,"count" => 5},
                                        {"value" => 0.25,"count" => 5}]} }

                                        
  expect(instance.calculate_coins(58.50)).to eq([58.5, [ {"value":5.0,"count":0},
                                                         {"value":3.0,"count":0},
                                                         {"value":2.0,"count":0},
                                                         {"value":1.0,"count":0},
                                                         {"value":0.5,"count":0},
                                                         {"value":0.25,"count":1}]])
  end
end