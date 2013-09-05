
'''
resources
http://blog.codahale.com/2005/11/24/a-ruby-howto-writing-a-method-that-uses-code-blocks/
'''

#simple yield
'''
def use_block()
	yield
end
use_block(){puts "potato"}
use_block()
#potato
#error
'''

#conditional yield using block_given?
'''
def cond_block()
	yield if block_given?
end
cond_block(){puts "potato\n"}
puts "___"
cond_block()
#potato
#___
'''

#code block with parameters (also conditional)
'''
def param_block()
	yield 1, "2" if block_given?
end

param_block()
param_block(){|a,b| puts "no param"}
#no param
param_block(){|a,b| puts "#{a}"}
#1
param_block(){|a,b| puts "#{a}, #{b}"}
#1, 2
param_block(){|a,b,c| puts "#{a}, #{b}"}
#1, 2
param_block(){|a,b,c| puts "#{a}, #{b}, #{c}"}
#1, 2,
#//note - default is nil
#//note also that values will be passed in an array and dealt with accordingly
'''

#code block with variable # or param
	#Proc.arity --> # param
#note - &varname means look for code block
'''
def vararg_block(&block)
	case block.arity
		when 0 
			yield
		when 1 
			yield '1'
		when 2 
			yield '2','3'
		else 
			yield
	end if block_given?
end
vararg_block()
vararg_block(){puts "no param"}
vararg_block(){|a| puts "#{a}"}
vararg_block(){|a,b| puts "#{a}, #{b}"}
vararg_block(){|a,b,c| puts "#{a}, #{b}, #{c}"}
#no param
#1
#2, 3
#, ,
'''



#TODO - multiple code blocks?