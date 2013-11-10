#Q: Want class of card classes?
#TODO: instances are virtually meaningless here - do away with subclasses or
#	update to use class variables.


class Card
	@@game_ending = false	#whether empty supply will end game

	#TODO: these parameters are badly named
	attr_reader :static_attributes, :event_attributes
	
	def initialize(static_attributes = {}, event_attributes = {}) 
		@static_attributes = static_attributes
		@event_attributes = event_attributes
	end
	
	def points(game = nil, p_index = nil)
		temp = event_attributes[:points]
		if(temp == nil) then return 0 end
		
		#note: does not deal with non-integer numbers - check numeric of fixnum
		if temp.is_a?(Integer) then return temp end
		
		#code for point checking must come from subclass or init.
		#todo use variable args
		if temp.is_a?(Proc) then return temp.call(game, p_index) end
		
		return 0
	end
	
	def to_s
		self.class.to_s
	end
	
	def self.game_ending?
		@@game_ending
	end
end

class Copper < Card
	def initialize
		super({:cost => 0, :treasure => true}, {:value => 1})
	end
end

class Silver < Card
	def initialize
		super({:cost => 3, :treasure => true}, {:value => 2})
	end
end

class Gold < Card
	def initialize
		super({:cost => 6, :treasure => true}, {:value => 3})
	end
end

class Estate < Card
	def initialize
		super({:cost => 2, :victory => true}, {:points => 1})
	end
end

class Duchy < Card
	def initialize
		super({:cost => 5, :victory => true}, {:points => 3})
	end
end

class Province < Card
	@@game_ending = true
	
	def initialize
		super({:cost => 8, :victory => true}, {:points => 6})
	end
end

class Gardens < Card
	
	def initialize
		super({:cost => 4, :victory => true},
			{:points => Proc.new{|game,p_index|
				game.players[p_index].deck.length/10
			}})
	end
end

class Village < Card
	def initialize
		super({:cost => 3, :action => true}, {:actions => 2, :cards => 1})
	end
end

class Curse < Card
	def initialize
		super({:cost => 0, :curse => true}, {:points => -1})
	end
end
