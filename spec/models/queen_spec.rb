require 'rails_helper'

RSpec.describe Queen, type: :model do
  
  it "can attack {x: 3, y: 2} and {x: 6, y: 5}" do
    queen = FactoryBot.create(:queen)
    expect(queen.can_attack?({x: 3, y: 2},{x: 6, y: 5})).to be true
  end

  it "can not attack {x: 3, y: 3} and {x: 6, y: 5}" do
    queen = FactoryBot.create(:queen)
    expect(queen.can_attack?({x: 3, y: 3},{x: 6, y: 5})).to be false
  end

  it "can attack {x: 3, y: 3} and {x: 5, y: 5}" do
    queen = FactoryBot.create(:queen)
    expect(queen.can_attack?({x: 3, y: 3},{x: 5, y: 5})).to be true
  end

  it "ensure kind is defined by default" do
    queen = FactoryBot.create(:queen)
    expect(queen.kind).to be 4
  end 

  it "can attack {x: 3, y: 2}, {x: 6, y: 5} and [{x:1, y:2},{x:5, y:5}]" do
    other_pieces = [{x:1, y:2},{x:5, y:5}]
    queen = FactoryBot.create(:queen)
    expect(queen.can_attack_with_other_pieces?({x: 3, y: 2},{x: 6, y: 5},other_pieces)).to be true
  end

  it "can not attack {x: 3, y: 2}, {x: 6, y: 5} and [{x:1, y:2},{x:5, y:4}]" do
    other_pieces = [{x:1, y:2},{x:5, y:4}]
    queen = FactoryBot.create(:queen)
    expect(queen.can_attack_with_other_pieces?({x: 3, y: 2},{x: 6, y: 5},other_pieces)).to be false
  end

end
