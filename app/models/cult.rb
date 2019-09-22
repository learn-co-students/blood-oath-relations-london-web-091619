class Cult
  attr_reader :name, :location, :slogan, :founding_year

  @@all = []

  def self.all
    @@all
  end

  def self.find_by_name(name)
    all.find { |cult| cult.name.eql?(name) }
  end

  def self.find_by_location(location)
    all.select { |cult| cult.location.eql?(location) }
  end

  def self.find_by_founding_year(year)
    all.select { |cult| cult.founding_year.eql?(year) }
  end

  def save
    self.class.all << self
  end

  def initialize(name:, location:, slogan:)
    @name = name
    @location = location
    @slogan = slogan
    @founding_year = Time.new.year
    save
  end

  def recruit_follower(follower)
    BloodOath.new(cult: self, follower: follower)
  end

  def blood_oaths
    BloodOath.all.select { |oath| oath.cult.eql?(self) }
  end

  def followers
    blood_oaths.map(&:follower)
  end

  def cult_population
    blood_oaths.count
  end
end
