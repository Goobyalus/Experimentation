


class Shell
	@@commands = {
		"listcmd" => :listcmd,
		"listobj" => :listobj,
		"hello" => :hello,
		"mkobj" => :mkobj,
		"rmobj" => :rmobj
	}
	
	@@objects = {
		
	}
	
	def commands
		return @@commands
	end
	def objects
		return @@objects
	end
	
	
	def listcmd(args)
		puts
		puts @@commands.keys.sort
	end
	
	def listobj(args)
		puts
		puts @@objects
	end
	
	def hello()
		puts
		puts "hello"
	end
	
	def mkobj(args)
		objname = args[0]
		obj = args[1]
		if not objname.is_a?(String) then raise "name must be string" end
		if @@objects[objname] != nil then raise "object already mapped" end
		
		@@objects[objname] = eval(obj)
		#puts "UNIMPLEMENTED"
	end
	
	def rmobj
		puts "UNIMPLEMENTED"
	end	
		

	
end







puts "Hello"
shell = Shell.new
begin
	print "> "
	buffer = gets.chomp.split(/\s/)
	
	shell.send(shell.commands[buffer[0]], buffer[1..buffer.length])#length-1 would be mroe correct
	
	

	puts
rescue Exception => e
	puts e.message
	puts e.backtrace.inspect
	
end while (buffer[0] != "exit")