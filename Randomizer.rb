

class Randomizer
	attr_reader :prob, :sym, :ttl_prts, :current, :discarded
	
	def initialize()
		reset()
	end
	
	def add_option(opt, parts)
		temp = @sym.index
		@sym.push(opt)
		@prob.push(parts)
		@ttl_prts += parts
	end
	
	def rem_option(opt)
		temp = @sym.index(opt)
		@prob.delete_at(temp)
		@sym.delete_at(temp)
		@ttl_prts -= 1
	end
	
	def reset()
		@prob = []
		@sym = []
		@ttl_prts = 0	
		@current = nil
		@discarded = []
	end
	
	def pull
		temp = rand(ttl_prts)
		i = 0
		j = 0
		#will fail if i has negative or 0 values
		while (i < @prob.length and j < temp) do
			j += prob[i]
		end
		
		@current = 
	end
	
	def return
		
	end
	
	def dup
		if @current == nil then return nil end
		
		
	end
	
	def discard
		if @current != nil
			@discarded.push @current
			@current = nil
		end
	end
	
	def to_s
		""
	end
end