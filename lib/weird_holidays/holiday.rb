class WeirdHolidays::Holiday 
    attr_accessor :name, :description, :url 
    def self.today
        #Scrape nationaltoday and then return today's weird holidays
        self.scrape_today
    end

    def self.scrape_today 
        @holidays = [] 
        self.scrape_national_today
        self.scrape_checkiday 
        @holidays 
    end 

    def self.scrape_national_today
        @natl_doc = Nokogiri::HTML(open("https://nationaltoday.com/what-is-today"))  
        @@holiday_one = self.new  
        @@holiday_one.name = @natl_doc.search("h2.entry-title").text.strip.split('Day')[0] + "Day"
        @holidays << @@holiday_one
    end 

    def self.scrape_checkiday
        @checkiday_doc = Nokogiri::HTML(open("https://checkiday.com"))
        @@holiday_two = self.new 
        @@holiday_two.name = @checkiday_doc.css("h2.mdl-card__title-text")[0].text.strip.split('is ')[1]
        @holidays << @@holiday_two
    end 

    def self.scrape_description_one
        @nodeset_one = @natl_doc.css('a')
        @@holiday_one.url = @nodeset_one.map{|element| element["href"]}.compact[35]
        @holiday_one_doc = Nokogiri::HTML(open("#{@@holiday_one.url}"))
        @@holiday_one.description = @holiday_one_doc.css('p')[1].text.strip 
        puts "\n\n" + @@holiday_one.description + "\n\n"
    end
    
    def self.scrape_description_two
        @nodeset_two = @checkiday_doc.css('a')
        @@holiday_two.url =  @nodeset_two.map{|element| element["href"]}.compact[20]
        @holiday_two_doc = Nokogiri::HTML(open("#{@@holiday_two.url}"))
        @@holiday_two.description = @holiday_two_doc.css('p')[0].text.strip
        puts "\n\n" + @@holiday_two.description + "\n\n" 
    end 
end 


