a = 4
b = 14

test_proc = Proc.new { |n|
	return n*a + b
}

p test_proc(0)