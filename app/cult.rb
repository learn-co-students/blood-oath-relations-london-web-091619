class Cult

attr_accessor :name, :location, :founding_year, :slogan, :minimum_age
  
    @@all = []
  
    def initialize(name, location, founding_year, slogan, minimum_age)
      @name = name
      @location = location
      @founding_year = founding_year
      @slogan = slogan
      @minimum_age = minimum_age
      @@all << self
    end
 
    def self.all
        @@all
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
          BloodOath.new(follower, self)
        else
          puts "Sorry, #{follower.name} is not yet old enough to join this cult."
        end
    end

    def blood_oaths
        BloodOath.all.select { |bloodoath| bloodoath.cult == self }
      end
    
      def followers
        blood_oaths.map { |bloodoath| bloodoath.follower }
      end

    def cult_population
        followers.length
      end
    
    def self.find_by_name(name)
      self.all.find do |cult|
        cult.name == name
      end
    end
  
    def self.find_by_location(location)
      self.all.select do |cult|
        cult.location == location
      end
    end
  
    def self.find_by_founding_year(year)
      self.all.select do |cult|
        cult.founding_year == year
      end
    end
  
    # def average_age
    #     total_age = followers.reduce(0) do | sum, follower |
    #      sum + follower.age
    #    end
    #    total_age / followers.length
    # end

    def average_age
        total_of_all_ages = followers.map { |follower| follower.age }
        num_of_followers = cult_population
        total_of_all_ages.to_f / num_of_followers.to_f 
    end
    
    def my_followers_mottos
        followers.map do |follower|
          follower.life_motto
        end
    end

    def self.least_popular
      self.all.min_by do |cult|
        cult.followers.length
      end
    end
  
    def self.most_common_location
        location = cult_locations.max_by do |location, count|
          count
        end
        location[0]
    end

    def self.cult_locations
      locations = {}
      self.all.each do |cult|
        if !locations[cult.location]
          locations[cult.location] = 1
        else
          locations[cult.location] += 1
        end
      end
      return locations
    end

end