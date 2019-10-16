class BloodOath


    attr_accessor :follower, :cult
    attr_reader :initialization_date

    @@all = [ ]


    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        @initialization_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
        @@all << self
    end


    def self.all
        @@all
    end

end