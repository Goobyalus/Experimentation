#This is written with Dominion in mind, so code may reflect Dominion-specific
#cosntructs.

#Q: implement collections as arrays or hashes?


#The "proper" way to shuffle; thanks to Dr. Kruskal.
#	note possibility of error if arr does not have a length
def shuffle(arr, len = arr.length)

	while ((len=len-1) >= 0) do
		i = rand(len)
		arr[len], arr[i] = arr[i],arr[len]
	end
end

ERRORS = {
	:Illegal_Play => "Illegal play",
	:Invalid_Choice => "Invalid card choice"
}


#Defines instances of deck building games
#	In the future, the game should act as a server, serving players' requests.
#	For now, the game is not distributed.
class Game
	attr_reader :players, :supplies, :phases, :trash, :turn, :phase
	attr_accessor :game_over
	
	#TODO: endgame conditions
	
	
	def initialize(supplies, players, phases)
		@supplies = supplies
		@players = players
		@phases = phases
		@trash = Array.new
		@turn = 0
		@phase = 0
	end
	
	
	#TODO - smart method = sort into bags, calculate each, multiply each
	def score(player)
		sum = 0
		
		players[player].deck.each{|card| sum = sum + card.points(self,player)}
		begin
			temp = player.point_tokens
		rescue
			temp = 0
		end
		if(temp != nil) then sum += temp end
		#TODO: Card.points()
		#note about infinite recursion and efficiency depending on code in card.points
		#
	end
	
	#
	def legal_play?(player, card)
		
	end
	
	#Checks oob
	#Checks legal play
	#Has player play card
	#Executes card
	def play_card(player, card_index)
	
		if(card_index >= @hand.length) then raise ERRORS[:Invalid_Choice] end
		
		card = player.hand[card_index]
		
		if(not legal_play?(player, card)) then raise ERRORS[:IllegalPlay] end
		
		player.play_card(card_index)
		execute_card(player, card)
	end
	
	#executes the effect of card played by player
	def execute_card(player, card)
		#TODO
		raise "UNIMPLEMENTED"		
	end
	
	def to_s
		plyr_str = ""
		players.each{|p| plyr_str = plyr_str + p.to_s + "\n\n"}
		"Players:\n#{plyr_str}\nTurn: #{turn}, Phase: #{phases[phase]}\nSupplies: #{supplies}\nTrash: #{trash}\n"
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
	
	def name
		card_class.class.to_s
	end
	
	def game_ending?
		card_class.game_ending?
	end
	
	def empty?
		cards.length == 0
	end
	
	def to_s
		"#{@card_class}, #{cards.length}"
	end
end




#Defines instances of players in a deck building game
class Player
	attr_reader :name, :deck, :hand, :hand_size, :play_area, :discard_pile,\
		:actions, :money, :buys #Q: maintain in Game instead?
	
	def initialize(name, deck, hand_size = 5)
		@name = name
		@deck = deck
		@hand = Array.new
		@hand_size = hand_size
		@play_area = Array.new
		@discard_pile = Array.new
		@actions = 0
		@money = 0
		@buys = 0
	end
	
	#moves card from hand into play_area
	def play_card(card_index)
	
		if(card_index >= @hand.length) then raise "invalid choice (oob)" end
			
		#error checking - done by game
		@play_area.push(@hand.delete_at(card_index))
						
	end
	
	
	
	
	
	def draw(n=5)
		#TODO: shuffle discard if n > (deck size + discard size)
		if @deck.empty? then shuffle_discard end
		if @deck.length < n then n = @deck.length end
		@hand.concat(@deck.pop(n))
	end
	
	
	def shuffle_deck
		shuffle(@deck)
	end
	
	def shuffle_discard
		@deck.concat(@discard_pile.pop(@discard_pile.length))
		shuffle(@deck)
		nil
	end
	
	def discard()
		#TODO
		:unimplemented
	end
	
	def discard_hand
		@discard_pile.concat(@hand)
		@hand = []
	end
	
	
	#discard everything; draw new hand
	#NOTE: it is game's responsibility to check for triggers beforehand
	#	Q: use exception handling instead? Have trigger code in card?
	#		card gets pointer to game, then calls execute with card code block?
	def end_turn
		
		@discard_pile.concat(@play_area.pop(@play_area.length))
		#TODO: check other zones, durations
		@discard_pile.concat(@hand.pop(@hand.length))
		
		draw(@hand_size)
		nil
	end
	
	def to_s
		"Name: #{@name}\nHand: #{@hand}"
	end
	
end








