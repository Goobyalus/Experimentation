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

	def simple_score
		game = DominionGame.new([Supply.new(Copper), Supply.new(Village), Supply.new(Province,1)],
					[Player.new("One",Array.new(7,Copper.new).concat(Array.new(3,Estate.new))),
					 Player.new("Two",Array.new(7,Copper.new).concat(Array.new(3,Estate.new)))],
					[:action, :buy])
		if game.score(0) != 3 then return false end
		if game.score(1) != 3 then return false end
		return true
	end
	module_function :simple_score
	
	def score_more
		game = DominionGame.new([Supply.new(Copper), Supply.new(Village), Supply.new(Province,1)],
					[Player.new("One",
						Array.new(7,Copper.new)
						.concat(Array.new(3,Duchy.new))
						.concat(Array.new(10,Curse.new))
						),
					 Player.new("Two",
						Array.new(7,Copper.new)
						.concat(Array.new(1,Province.new))
						.concat(Array.new(1,Estate.new))
						)
					],
					[:action, :buy])
		if game.score(0) != -1 then return false end
		if game.score(1) != 7 then return false end
		return true
	end
	module_function :score_more

	def score_garden
		game = DominionGame.new([Supply.new(Copper), Supply.new(Village), Supply.new(Province,1)],
					[Player.new("One",
						Array.new(7,Copper.new)
						.concat(Array.new(3,Gardens.new))
						.concat(Array.new(9,Estate.new))
						),
					 Player.new("Two",
						Array.new(7,Copper.new)
						.concat(Array.new(1,Gardens.new))
						.concat(Array.new(12,Estate.new))
						)
					],
					[:action, :buy])
				
		if game.score(0) != 12 then return false end
		if game.score(1) != 14 then return false end
		return true
	end
	module_function :score_garden
	
	def setup_game_manually
		
		game = DominionGame.new([Supply.new(Province,1)],
				[Player.new("One",
					Array.new(7,Copper.new)
					.concat(Array.new(3,Estate.new)
					)),
				Player.new("Two",
					Array.new(7,Copper.new)
					.concat(Array.new(3,Estate.new)
					))
				] #phases are default
			)
		
		game.players.each{|p| 
			p.shuffle_deck
			p.draw
		}

		game.players.each{|p|
			if(p.hand.size != 5) or (p.deck.size != 5) then return false end
		}
		return game
		#note: inspect hands to see if shuffling is occurring
	end
	module_function :setup_game_manually
	
	
	def dominion_initializer
		g = DominionGame.new
	end
	module_function :dominion_initializer
	
	def setup_default_game
		game = DominionGame.new
		game.set_up #should test using this function in other cases
		game
	end
	module_function :setup_default_game
	
	def play_treasure
		game = DominionGame.new
		game.set_up
		
		
		#TODO
		:unimplemented
	end
	module_function :play_treasure
	
	def buy_card
		#TODO
		:unimplemented
	end
	module_function :buy_card
	
	def play_village
		#TODO
		:unimplemented
	end
	module_function :play_village
	
	def default_deck
		#TODO
		:unimplemented
	end
	module_function :default_deck

	
end#MODULE

def test_all
	(Tests.public_methods(false) - Module.methods).each{|test|
		puts "____________________________#{test}_____________________________"
		begin
			puts Tests.send(test)
		rescue Exception => e
			puts e.message
			puts e.backtrace
		end
		puts
		puts
	}
end

test_all