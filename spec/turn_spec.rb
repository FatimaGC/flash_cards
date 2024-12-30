require './lib/turn'
require './lib/card'

RSpec.describe Turn do 
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    
    expect(turn).to be_instance_of(Turn)
  end

  it 'returns a Card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.card).to eq (card)
  end

  it 'returns a guess' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.guess).to eq ("Juneau")
  end

describe '#correct?' do
  it 'returns a boolean indicating if the guess matched the answer on the Card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    expect(turn.correct?).to eq true
  end

end
end