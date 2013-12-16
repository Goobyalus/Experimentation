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
end

a = [1,2,3,4,5,6,7,8,9]
temp = File.open("MarshalData.data","w")
data = Marshal.dump(a)# Marshal.dump(Potato)				#bitstream of Potato class
puts data
begin
	#IO.binwrite("MarshalData.data")
	IO.copy_stream(data,temp)
rescue Exception => e
	puts  e.message
end

