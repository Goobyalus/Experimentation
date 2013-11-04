#This is written with Dominion in mind, so code may reflect Dominion-specific
#cosntructs.

#Q: implement collections as arrays or hashes?


#The "proper" way to shuffle; thanks to Dr. Kruskal.
#	note possibility of error if arr does not have a length
def shuffle(arr, len = arr.length)
	len = len -1
	while (len > = 0) do
		i = rand(len)
		arr[len], arr[i] = arr[i],arr[len]
	end
end

#Defines instances of deck building games
#	In the future, the game should act as a server, serving players' requests.
#	For now, the game is not distributed.
class Game
	attr_reader :players, :supplies, :trash, :turn, :phase
	
	#the game should recognize two turn phases - :action and :buy
	
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
#	have identical cards in a supply pile. This can also be more efficient
#	with lazy evaluation instead of having a state.
class Supply
	attr_reader :card_class, :cards
	
	def initialize(card_class, num_cards = 10)
		@card_class = card_class
		@cards = Array.new(num_cards){card_class.new}
	end
end




#Defines instances of players in a deck building game
class Player
	attr_reader :name, :deck, :hand, :hand_size, :play_area, :discard_pile
	
	def initialize(name, deck, hand_size = 5)
		@name = name
		@deck = deck
		@hand = Array.new
		@hand_size = hand_size
		@play_area = Array.new
		@discard_pile = Array.new
	end
	
	#returns played card for game to execute
	def play_card(card_index)
	
		if(card_index >= @hand.length) then raise "invalid choice (oob)" end
		
		temp = @hand.delete_at(card_index)
		@play_area.push(temp)
		
		temp
		
	end
	
	
	
	def draw(n)
		if @deck.empty? then shuffle_discard end
		if @deck.length < n then n = @deck.length end
		@hand.concat(@deck.pop(n))
	end
	
	
	
	def shuffle_discard
		@deck.concat(@discard_pile.pop(@discard_pile.length))
		shuffle(@deck)
		nil
	end
	
	
	
	#discard everything; draw new hand
	#NOTE: it is game's responsibility to check for triggers beforehand
	#	Q: use exception handling instead?
	def end_turn
		
		@discard_pile.concat(@play_area.pop(@play_area.length))
		#TODO: check other zones
		@discard_pile.@concat(@hand.pop(@hand.length))
		
		draw(@hand_size)
		nil
	end
	
end









