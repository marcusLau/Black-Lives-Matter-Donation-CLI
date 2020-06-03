require 'pry'
require 'nokogiri'
require 'open-uri'

class Donate::Scraper 

    attr_accessor :foundations

    # scrape all Foundation obj parameters in this one method
    def start
        @foundations = []
        get_minnesota_page
        # get_aclu_page
        # get_brooklyn_page
        # get_visions_page
        # get_blm_page
    end

    # TODO: Need to scrape all info for Foundation obj data. 
    def get_minnesota_page
        doc = Nokogiri::HTML(open("https://minnesotafreedomfund.org/"))

        fund = Donate::Foundation.new
        fund.name = doc.css("div.wrapper").text.delete!("\n").strip # removes new lines and white spaces
        fund.mission = doc.css("div.image-subtitle-wrapper").text
        fund.url = doc.search("meta[property='og:url']").map {|n| n['content']}

        url_list = doc.css("div.collection")
        cloned_fund = Marshal.load(Marshal.dump(fund))
        fund.donate = cloned_fund.url[0].concat(url_list[6].children[1].attributes['href'].value)

        # fund.contact = cloned_contact.url[0].concat(url_list[5].children[1].attributes['href'].value)
        # donate[5] is contact
        # cloned_contact = cloned_donate

        @foundations << fund
        binding.pry
    end


end