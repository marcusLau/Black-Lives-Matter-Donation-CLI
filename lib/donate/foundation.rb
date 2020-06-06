require 'pry'

class Donate::Foundation

    attr_accessor :name, :desc, :mission, :url, :donate, :contact

    @@all = []

    def self.list 
        puts ""
        puts "----------- List of Funds -----------"
        puts ""
        @@all.each_with_index do |fund, i|
            puts "#{i+1}. #{fund.name}"
        end       
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