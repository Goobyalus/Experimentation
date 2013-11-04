require 'DomCards'

class Supply
	attr_accessor :cards, :card_class
	
	def initialize(card_class, num = 10)
		@card_class = card_class
		@cards = Array.new(num){card_class.new}
	end
	
	def is_empty?
		return num == 0
	end
	
	def purchase(player)
		if(@cards.length <= 0)
			raise 'empty supply'
		end
		
		if(player.num_buys <= 0)
			raise 'not enough buys'
		end
		
		if(player.money < cards[0].cost)
			raise 'not enough money'
		end
		
		cards.pop
	end
	
	def inspect()
		"#{@card_class.name}[#{@cards.length}]"
	end
end
	
	
class Player
	attr_accessor :name, :game, \
		:hand, :deck, :discard, :play, \
		:num_actions, :num_buys, :money
	
	def initialize(name, game)
		@name = name
		@game = game
		@num_actions = 0
		@num_buys = 0
		@money = 0
	end
	
	def count_points
		sum = 0
		
		
	end
	
	def print_hand()
		hand.each_index{|i| p "[#{i}]" + @hand[i].inspect}
	end
	
	def action_phase()
		return "actions all gone" if (@num_actions <= 0)	
		
		puts "select an action or end action phase with -1"
		print_hand()
		choice = Integer(gets.chomp)
		return "phase ended" if choice == -1
		
		if(@hand[choice].b_action)#does not check oob
			temp = @hand.delete_at(choice)
			@actions = @actions -1
		else
			p "invalid choice"
			return action_phase()
		end
		
		
		###
		
	end
	
	def buy_phase
	
	end
end

class Game
	attr_accessor :turn_i, :players, :cur_player, :gameover, :supplies
	
	def initialize()
		@players = [Player.new("one",self), Player.new("two",self)]
		@turn_i = 0
		@cur_player = 0
		take_turn()
	end
	
	def print_supplies()
		supplies.each{|s| p s.inspect}
	end
	
	def take_turn()
		if(@gameover) 
			return "Game Over"
		end
		
		players[cur_player].action_phase()
		players[cur_player].buy_phase()
		
		
	end
end	
	
	
g = Game.new()

	
	
	
	