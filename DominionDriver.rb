require "./DominionGame"
#require CardLoader
require './DominionCard'
require "./DominionTests"
#lambda for default hand?

=begin
game = DominoinGame.new([Supply.new(Copper), Supply.new(Village)],
				[Player.new("One",Array.new(7,Copper.new).concat(Array.new(3,Estate.new))),
				 Player.new("Two",Array.new(7,Copper.new).concat(Array.new(3,Estate.new)))],
				[:action, :buy])
				
puts game.to_s
=end

puts game_over_province

#load/update card database
#CardLoader.load_cards

#state variables


#user interaction
=begin
begin
	#select players

	#select cards from database

	#initialize game
	
	#tally win/loss
end until game.game_over or ((input = gets.chomp) == "exit") 
=end
#goodbye

