



#serialized data is converted back to ruby object.
#What is the point of #restore?

obj = Marshal.load(File.open("MarshalData.data",'r'))

puts obj.class
puts obj


