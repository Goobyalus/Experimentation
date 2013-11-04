

class Game
	attr_reader :deck
	
	def initialize
		@deck = Array.new(4,CardOne)
		p deck
		p deck[0].points_block
	end
	
	def get_points
		sum = 0
		
		@deck.each{|card| sum = sum + (card.points_block).call()}
	end
end

class CardOne
	attr_reader :points_block
	
	def initialize
		@points_block  = Proc.new{|deck| deck.each{|card| sum = sum + 1}; return sum}
	end
end

game = Game.new
p game.get_points