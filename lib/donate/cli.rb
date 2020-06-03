class Donate::CLI

    def call
        list_funds
        menu
        goodbye
    end

    def list_funds 
        @foundations = Donate::Foundation.list
    end

    """
    def get_url
        @url = Donate::Scraper.get_page
    end
    """

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the fund you'd like to get more info on:"
            input = gets.strip.downcase
            case input 
            when "1"
                puts "info 1 here" # will post info from Foundation scraped from scrapper class here.
            when "list"
                list_funds
            when "url"
                Donate::Scraper.new.start
            else 
                puts "Enter number 1-5, list, or exit: "
            end
        end
    end

    def goodbye
        puts "Goodbye"
    end

end
