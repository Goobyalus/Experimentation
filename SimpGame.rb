
class Card
	attr_reader :name, :text, :actions, :cost, :is_treasure, :is_victory, \
		:is_action, :is_reaction
	
	def initialize(name, text = nil, actions = nil, cost = 0,
		is_treasure = false, is_victory = false, is_action = false, 
		is_reaction = false)
		
		@name = name
		@text = text
		@actions = actions
		@cost = cost
		@is_treasure = treasure
		@is_victory = victory
		@is_action = is_action
		@is_reaction = is_reaction
	end
	
end

##need a subclass for type of card to avoid code block duplication? 

class Player
	attr_reader :name, :kingdom, :hand, :library, :discard, :action
	
	def initialize(player_name)
		raise ArgumentError, 'Name should be a String' \
			unless player_name.is_a? String
		@name = player_name
		@kingdom = Array.new(7,Card.new(copper))
	end
	
	def to_s()
		@name
	end
	
end

class Game
	attr_reader :players, :supplies, :turn, :restrictions, :curr_player
	
	def initialize()
		@players = Array.new
		@supplies = Array.new
	end
	
	def add_player(player_name)
		@players.push(Player.new(player_name))
	end
	
	def add_supply(card_name, size = 10)
		#push array of size cards onto supplies
		@supplies.push(Array.new(size, Card.new(card_name)))
	end
	
	def end_turn()
		curr_player += 1
		if curr_player >= players.length
			curr_player = 0
		end
		
		turn += 1
	end
	
end

game = Game.new()
game.add_player("Goob")
game.add_player("Gira")
puts game.players
game.add_player(1)
