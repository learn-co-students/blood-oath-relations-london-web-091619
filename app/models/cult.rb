require 'pry'
class Cult

    attr_accessor :name, :location, :founding_year, :slogan
    attr_reader 

    
@@all = [ ]

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

    def recruit_follower(follower)
      BloodOath.new(follower, self)
    end

    def cult_followers
        BloodOath.all.select { |bo| bo.cult == self}
    end
    def cult_population
        #returns a Fixnum that is the number of followers in this cult
        cult_followers.count
    end
   
    def self.find_by_name(name)
        Cult.all.select { |cult| cult.name == name}
    end

    def self.find_by_location(location)
        #takes a String argument that is a location and returns an Array
        # of cults that are in that location
        Cult.all.select { |c| c.location == location}
    end

    def self.find_by_founding_year(year)
        Cult.all.select { |c| c.founding_year == year}
    end

    def average_age
        #returns a Float that is the average age of this cult's followers
        total_age = cult_followers.map { |bo| bo.follower.age}.sum

        average_age = total_age.to_f / cult_population.to_f
    end

    def my_followers_mottos
        cult_followers.map { |bo| bo.follower.life_motto}
    end

    def self.least_popular
        #returns the Cult instance who has the least number of followers :(
        Cult.all.min_by { |c| c.follower.length}
    end

    def self.cult_locations
        locations = { }
        Cult.all.each do |cult|
            if !locations[cult.location]
                locations[cult.location] = 1
            else locations[cult.location] += 1
            end
        end
        locations
    end

    def self.most_common_location
       location = Cult.cult_locations.max_by do |location, count|
        count
       end
       location[0]
    end

end
