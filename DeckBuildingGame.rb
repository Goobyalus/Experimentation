#This is written with Dominion in mind, so code may reflect Dominion-specific
#cosntructs.

#Defines instances of deck building games
class Game
	attr_reader :players, :supplies, :trash, :turn, :phase
	
	def initialize(supplies, players)
		@supplies = supplies
		@players = players
	end
	
	def score(player)
		sum = 0
		
		player.deck.each{|card| sum = sum + card.points_proc}
		#TODO: Card.points()
		#note about infinite recursion and efficiency depending on code in card.points
		#
	end
	
	def to_s
		"#{players}, #{turn}, #{phase}\n#{supplies}\n#{trash}\n"
	end
end


#Defines instances of supply piles - stacks of cards
#	Could be more efficiently implemented with an integer instead of an array
#	but this allows the code to be easily adapted for other games that do not
#	have identical cards in a supply pile.
class Supply
	attr_reader :card_class, :cards
	
	def initialize(card_class, num_cards = 10)
		@card_class = card_class
		@cards = Array.new(num_cards){card_class.new}
	end
end

#Defines instances of players in a deck building game
class Player
	attr_reader :name, :deck, :hand, :play_area, :discard_pile
	
	def initialize(name, deck)
		@name = name
		@deck = deck
	end
end