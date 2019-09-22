
class BloodAuth
    @@all = []
    attr_reader :invitation_date, :cult, :follower
    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @invitation_date = Time.now.to_s.split(" ")[0]
        @@all << self
    end
    
    def self.all
        @@all
    end

    
    def self.first_auth
        self.sort_by_date.first
    end

    def self.sort_by_date
        self.all.sort do|auth| 
            split_dates = auth.invitation_date.split("-")
            split_dates = split_dates.join

            split_dates.to_i
        end
    end
end