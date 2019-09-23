class Follower
attr_accessor :name, :age, :life_motto
  
@@all = []
  
    def initialize(name, age, life_motto)
      @name = name
      @age = age
      @life_motto = life_motto
      @@all << self
    end
     
    def blood_oaths
        BloodOath.all.select { |blood_oath| blood_oath.follower == self }
    end 

    def cults
        blood_oaths.map { |blood_oath| blood_oath.cult }
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
          BloodOath.new(self, cult)
        else
          puts "Sorry, you are not yet old enough to join the cult of #{cult.name}"
        end
    end
    
    def self.all
      @@all
    end
  
    def self.of_a_certain_age(age)
      self.all.select { |follower| follower.age > age }
    end
  
    def my_cults_slogans
        cults.map do |cult|
          cult.slogan
        end
    end

    # def self.most_active
    #     self.follower_activity_sort[0]
    # end

    def self.most_active
        self.max_by { |follower| follower.cults.count}
    end

    def self.top_ten
        follower_activity_sort[0...9]
    end

    # def self.follower_activity_sort
    #    follower_activity = self.all.map do |follower|
    #      {follower => follower.cults.length}
    #    end
    #    sorted_follower_activity = follower_activity.sort_by do |follower|
    #      follower.values[0]
    #    end
    #    sorted_follower_activity.reverse
    # end
  
    def fellow_cult_members
        Follower.all.select do |follower|
          follower.cults & self.cults != [] && follower != self
        end
    end 

end
