require 'DomCards'
require 'dom'

=begin
c1 = Card.new
c2 = Copper.new
c3 = Estate.new

p c1
p c2 
p c3
=end
=begin
$ ruby testd.rb

Copper
Estate

=end


=begin
s1 = Supply.new(Copper,10)
s2 = Supply.new(Estate, 0)

p s1
p s2
=end
=begin
$ ruby testd.rb
Copper[10]
Estate[0]

=end


g = game.new
