require 'yaml'




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
		"I am a member of the Potato class. (#{name},#{weight},#{quality})"
	end
end

a = [1,2,3,4,5,6,7,8,9]
f = File.open("YAMLData.data","w")
data = YAML.dump(a)
#puts data

begin
	IO.binwrite("YAMLData.data",data)
rescue Exception => e
	puts  e.message
end

f.close

#write a class to file

f = File.open("YAMLData2.data","w")
data = YAML.dump(Potato)

begin
	IO.binwrite(f,data)
rescue Exception => e
	puts e.message
end
