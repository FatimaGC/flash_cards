require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", 10, :STEM)
card_2 = Card.new("What is Rachel's favorite animal?", "dog", :Turing_staff)
card_3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_staff)
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Beiber", :Turing_staff)

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

def start
  
end


puts "Welcome! You're playing with #{round.deck.count} cards."

#FIRST CARD 

puts "This is card 1 out of 4." #Hard code or make it dynamic?

puts "Question: #{round.current_card.question}"

guess = gets.to_i

round.take_turn(guess)

puts "#{round.turns[0].feedback}"







