require 'pry'
require 'nokogiri'
require 'open-uri'

    # get pages of foundation URLs
    # have a get_page method that will iterate thru an array of the foundation URLs 
    # feed that into get_page method 

    # iterates thru @foundation_urls and opens each url
    # returns an array of each URL 
class Donate::Scraper 

    def start
        get_page
    end

    def scrape_data
        test = self.get_page.css(".image-subtitle sqs-dynamic-text")
        binding.pry
    end

    # TODO: Need to scrape all info for Foundation obj data. 
    def get_page
        doc = Nokogiri::HTML(open("https://minnesotafreedomfund.org/"))
        mission_statement = doc.css("div.image-subtitle-wrapper")
        binding.pry
    end


end