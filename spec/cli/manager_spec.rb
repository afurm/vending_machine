require_relative "../../cli/manager.rb"

describe Manager do
  let(:instance) { Class.new { include Manager }.new }

  it 'should find correct product' do
    instance.stub(:read) { [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25} ] }

    expect(instance.find_product("Fanta", 2.7)).to eq([{"name"=>"Fanta", "count"=>1, "price"=>2.7},
                                                       [ 
                                                         {"name"=>"Fanta", "count"=>1, "price"=>2.7},
                                                         {"name"=>"CocaCola", "count"=>2, "price"=>2.0},
                                                         {"name"=>"OrangeJuice", "count"=>1, "price"=>3.0},
                                                         {"name"=>"Sprite", "count"=>2, "price"=>2.5},
                                                         {"name"=>"Water", "count"=>0, "price"=>3.25}]
                                                        ])
  end


  it 'should not find correct product if amount is less' do
    instance.stub(:read) { [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25}] }

    expect(instance.find_product("Fanta", 2.6)).to eq(["",
                                                       [ 
                                                         {"name"=>"Fanta", "count"=>2, "price"=>2.7},
                                                         {"name"=>"CocaCola", "count"=>2, "price"=>2.0},
                                                         {"name"=>"OrangeJuice", "count"=>1, "price"=>3.0},
                                                         {"name"=>"Sprite", "count"=>2, "price"=>2.5},
                                                         {"name"=>"Water", "count"=>0, "price"=>3.25}]
                                                        ])
  end

  it 'should not find correct product if name is incorrect' do
    instance.stub(:read) { [ {"name" => "Fanta","count" => 2,"price" => 2.7},
                             {"name" => "CocaCola","count" => 2,"price" => 2.0},
                             {"name" => "OrangeJuice","count" => 1,"price" => 3.0},
                             {"name" => "Sprite","count" => 2,"price" => 2.5},
                             {"name" => "Water","count" => 0,"price" => 3.25}] }
                             
    expect(instance.find_product("FakeFanta", 2.7)).to eq(["",
                                                       [ 
                                                         {"name"=>"Fanta", "count"=>2, "price"=>2.7},
                                                         {"name"=>"CocaCola", "count"=>2, "price"=>2.0},
                                                         {"name"=>"OrangeJuice", "count"=>1, "price"=>3.0},
                                                         {"name"=>"Sprite", "count"=>2, "price"=>2.5},
                                                         {"name"=>"Water", "count"=>0, "price"=>3.25}]
                                                        ])
  end
end