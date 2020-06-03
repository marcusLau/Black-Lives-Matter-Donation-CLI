require 'pry'

class Donate::Foundation

    attr_accessor :name, :mission, :url, :donate

    @@all = []

    def self.list 
        puts "Where to Donate"
        puts <<-DOC.gsub /^\s*/, '' # trims white space 
        1. Minnesota Freedom Fund
        2. American Civil Liberties Union (ACLU)
        3. Brooklyn Bail Fund
        4. Black Visions Collective 
        5. George Floyd GoFundMe
        DOC
    end

    def self.all
        @@all
    end

    def self.save(fund)
        @@all << fund
    end

end