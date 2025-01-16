class Turn 
  attr_reader :card,
              :guess
              

  def initialize(card, guess)
    @card = card
    @guess = guess
  end

  def correct?
    @card.answer == @guess
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end