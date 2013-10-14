a = 4
b = 14

test_proc = Proc.new { |n|
	n*1 + 4
}


p test_proc.call(0)
p test_proc.call(3)

