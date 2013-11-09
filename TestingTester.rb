require "./DominionGame"
require './DominionCard'



module Tests

def game_empty_province
	game = DominionGame.new([Supply.new(Copper), Supply.new(Village), Supply.new(Province,0)],
				[Player.new("One",Array.new(7,Copper.new).concat(Array.new(3,Estate.new))),
				 Player.new("Two",Array.new(7,Copper.new).concat(Array.new(3,Estate.new)))],
				[:action, :buy])
	game.over?
end

module_function :game_empty_province

def game_non_empty_province
	game = DominionGame.new([Supply.new(Copper), Supply.new(Village), Supply.new(Province,1)],
				[Player.new("One",Array.new(7,Copper.new).concat(Array.new(3,Estate.new))),
				 Player.new("Two",Array.new(7,Copper.new).concat(Array.new(3,Estate.new)))],
				[:action, :buy])
	not game.over?
end
module_function :game_non_empty_province


end#MODULE

def test_all
	(Tests.public_methods(false) - Module.methods).each{|test|
		puts test
		puts Tests.send(test)
		puts
	}
end

test_all