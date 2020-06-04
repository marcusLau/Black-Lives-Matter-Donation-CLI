require 'pry'

class Donate::Foundation

    attr_accessor :name, :desc, :mission, :url, :donate, :contact

    @@all = []

    def self.list 
        puts ""
        puts "----------- List of Funds -----------"
        puts ""
        puts <<-DOC.gsub /^\s*/, '' # trims white space 
        1. #{@@all[0].name}
        2. American Civil Liberties Union (ACLU)
        3. Brooklyn Bail Fund
        4. Black Visions Collective 
        5. Black Lives Matter
        DOC
    end

    def self.all
        @@all
    end

    def self.save(fund)
        @@all << fund
    end

    def self.find(index)
        puts ""
        puts "-> You have chosen: #{@@all[index].name}"
        @@all[index]
    end

end