require 'date'

#finding the number of Thursdays on 31sts between 1995 and 2013

day = 31
month = 1
year = 1995
thursdays = []

while year <= 2013
	while month <= 12	
		
		begin
		date = Date.new(year,month,day)
			if date.thursday?
				thursdays.push date
			end
		
		rescue Exception => e
			#puts e.message + " #{year},#{month},#{day}"
			#catch invalid dates for months without 31 days
		end
		
		
		
		month += 1

	end
	month = 1
	year += 1
end

puts "number of thursdays 1995 to 2013: #{thursdays.length}"
thursdays.each{|t| puts t.to_datetime.strftime('%a %b %d %H:%M:%S %Z %Y')} #format string was copied and has too much
#note: this is december, and the 31st of dec is not a thursday in 2013.
