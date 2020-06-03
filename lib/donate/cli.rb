require 'pry' 

class Donate::CLI

    def call
        Donate::Scraper.new.start # scrapes all data at start
        list_funds
        menu
        goodbye
    end

    def list_funds 
        Donate::Foundation.list
    end

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
                # Donate::Scraper.new.start
            else 
                puts "Enter number 1-5, list, or exit: "
            end
        end
        # binding.pry
    end

    def goodbye
        puts "Goodbye"
    end

end
