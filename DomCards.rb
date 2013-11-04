

class Card
	attr_accessor :name, :cost,\
		:b_treasure, :b_action, :b_victory,\
		:value, :points, \
		:num_actions, :num_buys, :num_cards
	
	def inspect()
		"#{@name}"
	end
end

class Copper < Card
	
	def initialize()
		@name = "Copper"
		@value = 1
		@cost = 0
		@points = 0
		@num_actions = 0
		@num_buys = 0
		@num_cards = 0
		@b_treasure = true
		@b_action = false
		@b_victory = false
	end
end

class Estate < Card
	def initialize()
		@name = "Estate"
		@value = 0
		@cost = 2
		@points = 1
		@num_actions = 0
		@num_buys = 0
		@num_cards = 0
		@b_treasure = false
		@b_action = false
		@b_victory = true
	end
end