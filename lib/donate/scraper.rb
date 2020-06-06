require 'pry'
require 'nokogiri'
require 'open-uri'

class Donate::Scraper 

    # scrape all Foundation obj parameters in this one method
    def start
        get_minnesota_page
        get_aclu_page
        get_brooklyn_page
        get_visions_page
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

    def get_aclu_page
        doc = Nokogiri::HTML(open("https://aclu.org/"))

        aclu = Donate::Foundation.new
        aclu.name = doc.css("meta[property='og:title']").map {|n| n['content']}[0]
        aclu.mission = doc.css("meta[name='og:description']").map {|n| n['content']}[0]
        aclu.desc = doc.css("div.container p")[8].children.text
        aclu.url = doc.css("meta[property='og:url']").map {|n| n['content']}[0]
        aclu.donate = doc.css("div.acluvl a")[0].attributes['href'].value
        aclu.contact = doc.css("ul.branded-footer-links")[0].children[0].children[0].attributes['href'].value

        Donate::Foundation.save(aclu)
        # binding.pry
    end

    def get_brooklyn_page
        doc = Nokogiri::HTML(open("https://brooklynbailfund.org/"))
        mission_doc = Nokogiri::HTML(open("https://brooklynbailfund.org/about-us"))

        bail = Donate::Foundation.new
        bail.name = doc.css("meta[property='og:title']").map {|n| n['content']}[0]
        bail.url = doc.css("meta[property='og:url']").map {|n| n['content']}[0]
        bail.desc = doc.css("div#block-yui_3_17_2_1_1590879870327_5038 strong").text
        bail.mission = mission_doc.css("div.sqs-block-content p")[0].text

        cloned_bail_url = Marshal.load(Marshal.dump(bail))
        bail.donate = cloned_bail_url.url + doc.css("div#headerNav a")[7].attributes['href'].value

        bail.contact = doc.css("div.sqs-block-content p")[1].children[4].attributes['href'].value
        
        Donate::Foundation.save(bail)
        # binding.pry 
    end

    def get_visions_page 
        doc = Nokogiri::HTML(open("https://www.blackvisionsmn.org/"))

        visions = Donate::Foundation.new
        visions.name = doc.css("meta[property='og:title']").map {|n| n['content']}[0]
        visions.url = doc.css("meta[property='og:url']").map {|n| n['content']}[0]
        visions.desc = doc.css("div.sqs-block-content p")[0].text
        visions.mission = doc.css("div.sqs-block-content p")[1].text
        visions.donate = doc.css("div.sqs-block-button-container--center a")[0].attributes['href'].value
        visions.contact = doc.css("div#block-yui_3_17_2_1_1555818226558_3757 p")[0].children[1].attributes['href'].value

        Donate::Foundation.save(visions)
        # binding.pry
    end

end