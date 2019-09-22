class BloodOath
  attr_reader :cult, :follower, :initiation_time

  @@all = []

  def self.all
    @@all
  end

  def self.first_oath
    all.first
  end

  def save
    self.class.all << self
  end

  def initialize(cult:, follower:)
    @cult = cult
    @follower = follower
    @initiation_time = Time.new
    save
  end

  def initiation_date
    initiation_time.strftime("%Y-%m-%d")
  end
end
