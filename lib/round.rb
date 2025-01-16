class Round 
  attr_reader :turns

  attr_accessor :deck

  def initialize(deck)
    @deck = deck 
    @turns = []
  end

  def current_card
    @deck.cards.shift
  end
end