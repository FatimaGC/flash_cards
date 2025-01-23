class Turn 
  attr_reader :card,
              :guess
              

  def initialize(card, guess)
    @card = card
    @guess = guess
  end

  def correct?
    # @card.answer == @guess
    @guess == @card.answer || @guess.to_i == @card.answer
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end