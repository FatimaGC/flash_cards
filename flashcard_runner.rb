require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

#Start the round using a new method called start.

def start
  card_1 = Card.new("What is 5 + 5?", 10, :STEM)
  card_2 = Card.new("What is Rachel's favorite animal?", "dog", :Turing_staff)
  card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
  card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :Turing_staff)

  deck = Deck.new([card_1, card_2, card_3, card_4])

  round = Round.new(deck)

  #Output first message: "Welcome! You're playing with 4 cards."

  total_number_of_cards = round.deck.cards.count
  puts "Welcome! You're playing with #{total_number_of_cards} cards." #This needs to be outside of the loop so the number never changes. 

  #Loop through deck.cards
  index = 1

  while !round.deck.cards.empty? do
    #Output & actions that need to repeat per card:

    #Card position - "This is card number X out of 4."
    puts "This is card number #{index} out of #{total_number_of_cards}"

    #Card question - "Question: "
    puts "Question: #{round.current_card.question}"

    #GET user input (guess)
    guess = gets.chomp #Need to make sure this handles integers and strings so the comparison is correct.

    #Call take_turn method which does the following:
      #Takes in the guess
      #Creates a new turn which includes the current card info and the guess 
      #Pushes the turn into the turns array of the round 
      #Shifts the deck to the next card 
      #Returns the turn 

    current_turn = round.take_turn(guess)

    #Return Turn Feedback (whether guess was correct or incorrect).
    puts current_turn.feedback

    index += 1
  end

  puts "****** Game over! ******"

  puts "You had #{round.number_correct} correct guesses out of #{total_number_of_cards} for a total score of #{format("%.0f%%", round.percent_correct)}."
end

start()








































