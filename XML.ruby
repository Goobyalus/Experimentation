require 'rexml/document'

#http://www.germane-software.com/software/rexml/docs/tutorial.html
#http://www.germane-software.com/software/rexml_doc/classes/REXML/Element.html

file = File.new("Cards.xml")
doc = REXML::Document.new file

doc.elements.each("root/card"){|element| puts element.attributes["name"]}