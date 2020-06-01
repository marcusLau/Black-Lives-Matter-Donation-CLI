class Donate::CLI

    def call
        
        list_funds
        menu
        goodbye
    end

    def list_funds 
        puts "Where to Donate"
        puts <<-DOC.gsub /^\s*/, '' # trims white space 
        1. Minnesota Freedom Fund
        2. American Civil Liberties Union (ACLU)
        3. Brooklyn Bail Fund
        4. Black Visions Collective 
        5. George Floyd GoFundMe
        DOC
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the fund you'd like to get more info on:"
            input = gets.strip.downcase
            case input 
            when "1"
                puts "info 1 here"
            when "list"
                list_funds
            end
        end
    end

    def goodbye
        puts "Goodbye"
    end

end
