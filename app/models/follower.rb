class Follower
    @@all = []
    attr_reader :name, :age, :life_motto

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def join_cult(cult)
        BloodAuth.new(cult, self)
    end

    def cults
        find_blood_auths.map{|bloodauth| bloodauth.cult}
    end

    def find_blood_auths
        BloodAuth.all.select{|bloodauth| bloodauth.follower == self}
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(agesearch)
        all.select{|follower| follower.age == agesearch}
    end

    def my_cults_slogans
        cults.each{|cult| puts(cult.slogan)}
    end

    def self.most_active(list = self.all)
        most_cults = 0
        most_active_follower = ""

        list.each do |follower|
            cult_count = 0
            follower.cults.each do |cult|
                cult_count += 1
            end
            if cult_count > most_cults
                most_cults = cult_count
                most_active_follower = follower
            end
        end
        most_active_follower
    end

    def self.top_ten
        top_ten_arr = []
        followers_left = self.all

        10.times do
            cur_follower = self.most_active(followers_left)
            top_ten_arr << cur_follower
            followers_left.delete(cur_follower)
        end

        top_ten_arr
    end


end