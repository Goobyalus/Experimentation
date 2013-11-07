require "./DeckBuildingGame"
#require CardLoader
require './DominionCard'

#lambda for default hand?

game = Game.new([Supply.new(Copper), Supply.new(Village)],
				[Player.new("One",Array.new(7,Copper.new).concat(Array.new(3,Estate.new))),
				 Player.new("Two",Array.new(7,Copper.new).concat(Array.new(3,Estate.new)))],
				[:action, :buy])
				
puts game.to_s

#load/update card database
#CardLoader.load_cards

#state variables


#user interaction

	#select players

	#select cards from database

	#initialize game
	
	#tally win/loss

#goodbye

