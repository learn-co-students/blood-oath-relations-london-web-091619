class Follower


    attr_accessor :name, :age, :life_motto
    attr_reader 


    @@all = [ ]


        def initialize(name, age, life_motto)
            @name = name
            @age = age 
            @life_motto = life_motto
            @@all << self
        end

        
        def self.all
            @@all
        end

        def blood_oaths
            BloodOath.all.select { |bo| bo.follower == self}
        end
        
        def cults
            #returns an Array of this follower's cults
            blood_oaths.map { |bo| bo.cult}.map { |c| c.name}.uniq
        end

        def join_cult(cult)
            BloodOath.new(self, cult)
        end

        def self.of_a_certain_age(age)
            Follower.all.select { |f| f.age >= age}
        end

        def my_cults_slogans
            #prints out all of the slogans for this follower's cults
           blood_oaths.map { |bo| bo.cult.slogan}
        end

    end