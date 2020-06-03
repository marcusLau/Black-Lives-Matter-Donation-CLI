require 'pry'

class Donate::Foundation

    attr_accessor :name, :mission, :url


    # Returns an array of Foundation instances 
    def self.list 
        puts "Where to Donate"
        puts <<-DOC.gsub /^\s*/, '' # trims white space 
        1. Minnesota Freedom Fund
        2. American Civil Liberties Union (ACLU)
        3. Brooklyn Bail Fund
        4. Black Visions Collective 
        5. George Floyd GoFundMe
        DOC
        foundation_1 = self.new 
        foundation_1.name = "Minnesota Freedom Fund"
        foundation_1.mission = "Mission"
        foundation_1.url = "url"

        foundation_1
        # binding.pry #  so foundation_1 is accessible and has the correct parameters
    end

end