
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
def param_block()
	yield 1, "2" if block_given?
end
