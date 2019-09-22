class BloodOath
  attr_reader :cult, :follower, :initiation_date

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(cult:, follower:)
    @cult = cult
    @follower = follower
    @initiation_date = Time.new.strftime("%Y-%m-%d")
    save
  end
end
