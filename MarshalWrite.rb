#require 'io'

#http://ruby-doc.org/core-2.0.0/Marshal.html
=begin
Some objects cannot be dumped: if the objects to be dumped include bindings, procedure or method objects, instances of class IO, or singleton objects, a TypeError will be raised.
=end


class Potato
	attr_accessor :name, :weight, :quality
	
	def initialize(name, weight, quality)
		@name = name
		@weight = weight
		@quality = quality
	end
	
	def potato_stats
		"name: #{name}, weight: #{weight}, quality: #{quality}"
	end
	
	def to_s
		"I am a member of the Potato class"
	end
end

a = [1,2,3,4,5,6,7,8,9]
f = File.open("MarshalData.data","w")
data = Marshal.dump(a)
#puts data

begin
	IO.binwrite("MarshalData.data",data)
rescue Exception => e
	puts  e.message
end

f.close

#write a class to file

f = File.open("MarshalData2.data","w")
data = Marshal.dump(Potato)

begin
	IO.binwrite(f,data)
rescue Exception => e
	puts e.message
end
