require 'pry'
require 'nokogiri'
require 'open-uri'

class Donate::Scraper 

    # scrape all Foundation obj parameters in this one method
    def start
        get_minnesota_page
        # get_aclu_page
        # get_brooklyn_page
        # get_visions_page
        # get_blm_page
    end
 
    def get_minnesota_page
        doc = Nokogiri::HTML(open("https://minnesotafreedomfund.org/"))

        fund = Donate::Foundation.new
        fund.name = doc.css("div.wrapper").text.delete!("\n").strip # removes new lines and white spaces
        fund.mission = doc.css("div.image-subtitle-wrapper").text
        fund.url = doc.search("meta[property='og:url']").map {|n| n['content']}[0]
        fund.desc = doc.search("meta[property='og:description']").map {|n| n['content']}[0]

        url_list = doc.css("div.collection")
        cloned_fund = Marshal.load(Marshal.dump(fund)) # Ruby objects pointing to the same obj?
        fund.contact = cloned_fund.url + (url_list[5].children[1].attributes['href'].value)
        fund.donate = cloned_fund.url + (url_list[6].children[1].attributes['href'].value)

        Donate::Foundation.save(fund)
        # binding.pry
    end


end