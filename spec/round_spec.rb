require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
  it 'is an instance of Round' do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  describe '#initialize' do
    it 'returns a deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.deck).to eq (deck)
    end

    it 'has an empty array for turns as a default' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
  
      expect(round.turns).to eq ([])
    end
  end

  describe '#current_card' do
    it 'returns the top card in the deck array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.current_card).to eq (deck.cards.first)
    end
  end

  describe '#take_turn' do
    #Receives a guess as a string
    #Creates a new Turn object with the corresponding guess and card
    #Stores this new turn and returns it
    #When this method is called, Round moves to the next card

    it 'creates an instance of the Turn class' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(new_turn).to be_instance_of(Turn)
    end

    it 'stores a new turn' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(round.turns).to eq ([new_turn])
    end

    it 'moves round to the next card in the deck' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)

      expect(round.current_card).to eq (card_1)

      new_turn = round.take_turn("Juneau")

      expect(round.current_card).to eq (card_2)
    end
  end
  
  describe '#number_correct' do
    it 'returns the count of correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(round.number_correct).to eq 1
    end
  end

  describe '#number_correct_by_category' do
    it 'returns the count of correct guesses by category' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      new_turn = round.take_turn("Juneau")

      expect(round.number_correct_by_category(:Geography)).to eq 1
    end
  end

  describe '#percent_correct' do 
    it 'returns the corresponding percentage of correct guesses' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
  
      deck = Deck.new([card_1, card_2, card_3])
      round = Round.new(deck)
      turn_1 = round.take_turn("Juneau")      
      turn_2 = round.take_turn("Venus")

      expect(round.percent_correct).to eq 50.0
    end
  end

end