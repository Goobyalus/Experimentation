



#serialized data is converted back to ruby object.
#What is the point of #restore?

obj = Marshal.load(File.open("MarshalData.data",'r'))

puts obj.class
puts obj
puts

#does not write the definition of the class!
begin
obj = Marshal.load(File.open("MarshalData2.data",'r'))

puts obj.class
puts obj
rescue
end

require './MarshalWrite'

obj = Marshal.load(File.open("MarshalData2.data",'r'))

puts obj.class
puts obj


