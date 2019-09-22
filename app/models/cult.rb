class Cult
    @@all = []
    attr_reader :name, :location, :founding_year, :slogan
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.find_by_name(cultsearch)
        all.select{|cult| cult.name == cultsearch}
    end

    def self.find_by_location(cultsearch)
        all.select{|cult| cult.location == cultsearch}
    end
    
    def self.find_by_founding_year(cultsearch)
        all.select{|cult| cult.founding_year == cultsearch}
    end
        
    def average_age
        find_cult_members.reduce(0) {|sum, follower| sum + follower.age} / find_cult_members.length
    end
    
    def find_cult_members
        find_bloodauths.map {|bloodauth| bloodauth.follower}
    end

    def find_bloodauths
        BloodAuth.all.select{|bloodauth| bloodauth.cult == self}
    end

    def my_followers_mottos
        find_cult_members.each {|member| puts(member.life_motto)}
    end

    def self.least_popular
        self.all.min_by{|cult| cult.find_cult_members}
    end

    def self.most_common_location
        locations = self.all.map{|cult| cult.location}
        locations.max_by{|location| locations.count(location)}
    end
end