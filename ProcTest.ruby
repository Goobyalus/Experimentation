a = 4
b = 14

test_proc = Proc.new { |n|
	n*1 + 4
}

def get_proc
	return Proc.new{|n| n*1+4}
end


p test_proc.call(0)
p test_proc.call(3)


#trying to figure out how to add a method to this class on the fly
class testing
	
	

end

t = testing.new
p t.meth1(0)