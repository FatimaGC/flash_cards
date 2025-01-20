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
    @deck.cards.shift
    return new_turn
  end

  def number_correct
    # correct = 0

    # @turns.each do |turn|
    #   if turn.correct? == true
    #     correct += 1
    #   end
    # end

    # return correct

    #REFACTORED
    @turns.filter {|turn| turn.correct?}.count
  end

  def number_correct_by_category(category)
    #For the category Geography, how many correct answers are there?
    #Compare the category to the data in turns and return that number
    correct_guesses = @turns.filter {|turn| turn.correct?}

    correct_guesses.filter {|turn| turn.card.category == category}.count
  end

  def percent_correct 
    (number_correct / @turns.count) * 100
  end
end