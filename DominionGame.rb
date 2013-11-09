require "./DeckBuildingGame"


class DominionGame < Game



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