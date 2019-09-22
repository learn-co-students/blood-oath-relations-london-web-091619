class Cult
  attr_accessor :minimum_age
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

  def self.least_popular
    all.min_by(&:cult_population)
  end

  def self.locations
    all.map(&:location)
  end

  def self.most_common_location
    locations.max_by { |location| locations.count(location) }
  end

  def save
    self.class.all << self
  end

  def initialize(name:, location:, slogan:)
    @name = name
    @location = location
    @slogan = slogan
    @founding_year = Time.new.year
    @minimum_age = 0
    save
  end

  def recruit_follower(follower)
    if follower.age < minimum_age
      puts 'Sorry, you are too young!'
      return false
    end

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

  def follower_ages
    followers.map(&:age)
  end

  def average_age
    follower_ages.reduce(:+) / cult_population
  end

  def my_followers_mottos
    followers.map(&:life_motto)
  end
end
