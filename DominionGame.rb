require "./DeckBuildingGame"


class DominionGame < Game

	#class method returns standard starting deck
	def self.default_deck
		Array.new(7,Copper.new).concat(Array.new(3,Estate.new))
	end

	def initialize(supplies = nil,
			#4 players with default decks
			#TODO use generator for player names
			players = [	Player.new("One",DominionGame.default_deck),
						Player.new("Two",DominionGame.default_deck),
						Player.new("Three",DominionGame.default_deck),
						Player.new("Four",DominionGame.default_deck)
						],
			#phases should not be passed, but may be for backwards compatibility
			phases = [:action, :buy, :cleanup]	)
			
			#determine size of standard suppy piles
			if supplies == nil
				#currently unnecessary because of hardcoding
				case players.size
				when 1..2
					std_size = 8
				when 3
					std_size = 10
				when 4
					std_size = 12
				else
					std_size = 12
				end
				
				supplies = []
				supplies.push(Supply.new(Estate,	std_size))
				supplies.push(Supply.new(Duchy,		std_size))
				supplies.push(Supply.new(Province,	std_size))
				supplies.push(Supply.new(Copper,	50))
				supplies.push(Supply.new(Silver,	40))
				supplies.push(Supply.new(Gold,		30))			
			end
			
		super(supplies, players, phases)
	end
	
	#set up the game
	def set_up
		#TODO: check setup conditions on supply cards and game options
		#TODO: decide on when it is appropriate to call this or add checks.
		#	Should this be like reset?
		
		#[f:signals to do this in parallel]
		@players.each{|p|
			#p.discard_hand
			p.shuffle_deck
			p.draw
		}
	end

	def over?
		empty_count = 0
		
		@supplies.each{|supply|
			if(supply.empty?)
				if(supply.game_ending?) then return true end
				empty_count = empty_count + 1
				if (empty_count == 3) then return true end
			end
		}
		false
	end
	
end