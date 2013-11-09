#Q: Want class of card classes?


class Card
	@@game_ending = false	#whether empty supply will end game

	attr_reader :static_attributes, :event_attributes
	
	def initialize(static_attributes, event_attributes) 
		@static_attributes = static_attributes
		@action_attributes = event_attributes
	end
	
	#TODO need to deal with points' arguments
	def points(
		if end
	end
	
	def to_s
		self.class
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

class Village < Card
	def initialize
		super({:cost => 3, :action => true}, {:actions => 2, :cards => 1})
	end
end

