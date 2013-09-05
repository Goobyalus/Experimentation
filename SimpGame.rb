
class Card
	attr_accessor :name, :text, :actions
	
	def initialize(name, text = nil, actions = nil)
		@name = name
		@text = text
		@actions = actions
	end
	
end

class Player
	attr_accessor :name
	
	def initialize(player_name)
		@name = player_name
	end
	
end

class Game
	attr_accessor :players, :supplies, :turn, :restrictions, :curr_player
	
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
