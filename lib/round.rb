class Round 
  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck 
    @turns = []
  end

  def current_card
      @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(current_card, guess)
    @turns.push(new_turn)
    return new_turn
  end
end