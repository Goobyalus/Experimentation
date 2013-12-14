


class Shell
	@@commands = {
		"listcmd" => :listcmd,
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
	
	
	def listcmd()
		puts
		puts @@commands.keys.sort
	end
	
	def hello()
		puts
		puts "hello"
	end
	
	def mkobj(objname, obj)
		if not objname.is_a?(String) then raise "name must be string" end
		if @@objects[objname] != nil then raise "object already mapped" end
		
		puts "UNIMPLEMENTED"
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
	
	shell.send(shell.commands[buffer[0]])
	
	

	puts
rescue Exception => e
	puts e.message
	puts e.backtrace.inspect
	
end while (buffer[0] != "exit")