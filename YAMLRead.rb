
require 'yaml'


#serialized data is converted back to ruby object.
#What is the point of #restore?

obj = YAML.load(File.open("YAMLData.data",'r'))

puts obj.class
puts obj
puts

#does not seem to write the definition of the class! Needs more research.
begin
obj = YAML.load(File.open("YAMLData2.data",'r'))

puts obj.class
puts obj
rescue
end

#given the require this works, but what is the point. How to write a class definition?
begin
	class Potato 
	end

obj = YAML.load(File.open("YAMLData2.data",'r'))

puts "part 2"

puts obj.class
puts obj
a = obj.new(1,1,1)
puts a
rescue
end

begin
require './YAMLWrite'

puts "part 3"

obj = YAML.load(File.open("YAMLData2.data",'r'))

puts obj.class
puts obj
a = obj.new(1,1,1)
puts a
end