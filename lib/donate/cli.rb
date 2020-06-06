require 'pry' 

class Donate::CLI

    attr_accessor :done

    def call
        @done = false
        puts ""
        puts "George Floyd: Help, Donate, and Learn"
        start
        list_funds
        menu
    end

    def start 
        Donate::Scraper.new.start
    end

    def list_funds 
        Donate::Foundation.list
        puts ""
    end

    def menu
        input = nil
        puts "--------------- Menu ----------------"
        puts ""
        puts "-> Enter 'list' to list all funds. "
        puts "-> Enter 'exit' to exit the CLI."
        puts "-> Enter 'menu' to display the menu."
        puts "-> Enter 'help' to display commands."
        while !done

            puts "-> Please enter a command or the number of the fund you'd like to get more info on: "
            input = gets.strip.downcase
            if input.to_i.between?(1, 5) 
                process_input(input)
            end
            case input 
            when "list"
                list_funds
            when 'menu'
                menu
            when "exit"
                @done = true
                terminate
            when 'help'
                help
            else 
                puts ""
                puts "-> Invalid input. Please enter in a valid input."
            end
        end
        # binding.pry
    end

    def help 
        puts ""
        puts "--------------- Help ----------------"
        puts ""
        puts "-> Enter 'list' to list all funds. "
        puts "-> Enter 'exit' to exit the CLI."
        puts "-> Enter 'menu' to display the menu."
        puts ""
    end

    def process_input(input)
        # binding.pry
        fund = Donate::Foundation.find(input.to_i-1) 
        print_fund(fund)
        continue
    end

    def continue
        puts "-> Would you like to view another fund? (Y/N): "
        input = gets.strip.downcase
        if input == 'y' 
            list_funds
            menu
        elsif input == 'n'
            terminate
        else
            puts ""
            puts "Invalid input. Please enter again."
            puts ""
            continue
        end
    end

    def terminate
        @done = true
        puts "" 
        puts "-> Terminating CLI."
        exit
    end

    # Pass a fund and print out fund's details in CLI
    def print_fund(fund)
        puts ""
        puts "----------- #{fund.name} -----------"
        puts ""
        puts "Website:     #{fund.url}"
        puts "Contact:     #{fund.contact}"
        puts "Donations:   #{fund.donate}"
        puts ""
        puts "Description: "
        puts ""
        puts "#{fund.desc}"
        puts ""
        puts "Mission Statement: "
        puts ""
        puts "#{fund.mission}"
        puts ""
        puts "-----------------------------------------------"
        puts ""
    end

end
