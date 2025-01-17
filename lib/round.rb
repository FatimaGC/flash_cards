class Round 
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck 
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end

  def take_turn(guess)
    Turn.new(current_card, guess)
  end
end