#simple Ruby file IO

#IO modes are here: http://ruby-doc.org/core-2.0.0/IO.html#method-c-new



#write a string
a = [0,2,3,4,5]

f = File.open("FileIOTest.txt",'w')
f.puts(a)
f.puts("END")
f.close			#needed before opening to read
				#because pointer will be at EOF`

#read a string

f = File.open("FileIOTest.txt",'r')
while (temp = f.gets)
	a.push(temp)
end

puts a