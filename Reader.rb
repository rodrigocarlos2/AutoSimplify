require 'fileutils'
require 'tempfile'

class Exec1

	def start

		Dir.new('.').each {|file|
			
			next if File.directory? file

			if file!="Reader.rb"

				file2 = File.open("#{file}","r")

				isFirst = 0
				
				file2.each_line do |line|
			  		
			  		puts line

			  		if (line.include? "<<< ERROR!")

			  			if isFirst==0
			  				file3 = File.open("#{file}_new","a+")
			  				file3.puts "------------------------------------------------------------------------------"
			  				file3.puts "Original file: #{file}"
			  				file3.puts "------------------------------------------------------------------------------"
			  				file3.puts ""
			  				file3.close
			  				isFirst=1
			  			end

			  			file3 = File.open("#{file}_new","a+")
			  			file3.puts line
			  			file3.close

			  		end

				end

				file2.close

			end
		}

	end

end

ex1 = Exec1.new

ex1.start