require './lib/turn'
require './lib/card'

RSpec.describe Turn do 
  it 'is an instance of Turn' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new(card, "Juneau")
    
    expect(turn).to be_instance_of(Turn)
  end

  describe '#initialize' do
    it 'returns a Card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new(card, "Juneau")

      expect(turn.card).to eq (card)
    end

    it 'returns a guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new(card, "Juneau")

      expect(turn.guess).to eq ("Juneau")
    end
  end
  

  describe '#correct?' do
    it 'returns a boolean indicating if the guess matched the answer on the Card' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new(card, "Juneau")

      expect(turn.correct?).to eq true
    end
  end

  describe '#feedback' do 
    it 'returns "Correct!" or "Incorrect." based on whether the guess was correct or not.' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new(card, "Juneau")

      turn.correct?
      
      expect(turn.feedback).to eq ("Correct!")
    end
  end
end