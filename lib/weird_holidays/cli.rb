class WeirdHolidays::CLI 

    def call 
        list_holidays 
        menu 
    end 

	def list_holidays 
		puts "Today is: "
		@holiday_ary = WeirdHolidays::Holiday.today 
		@holiday_ary.each.with_index(1) do |holiday, i| 
			puts "#{i}. #{holiday.name}"
		end
	end

	def menu 
		input = nil
		while input != "exit"
			puts "Enter the number of a holiday to get more info on it, type 'list' to see them all again, or type 'exit' to leave the program: "
			input = gets.strip.downcase 
			if input.to_i > 0
				WeirdHolidays::Holiday.scrape_descriptions(input)
			elsif input == "list"
				list_holidays
			elsif input == "exit"
				puts "Goodbye! Remember to check back tomorrow to see what weird holiday it is!"
			else
				puts "I'm not sure what you want me to do. Type list or exit." 
			end 
		end 
	end
end 