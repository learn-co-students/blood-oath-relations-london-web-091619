class Follower
  attr_accessor :life_motto
  attr_reader :name, :age

  @@all = []

  def self.all
    @@all
  end

  def self.of_a_certain_age(min_age)
    all.select { |follower| follower.age >= min_age }
  end

  def save
    self.class.all << self
  end

  def initialize(name:, age:, life_motto:)
    @name = name
    @age = age
    @life_motto = life_motto
    save
  end

  def blood_oaths
    BloodOath.all.select { |oath| oath.follower.eql?(self) }
  end

  def cults
    blood_oaths.map(&:cult)
  end

  def join_cult(cult)
    BloodOath.new(cult: cult, follower: self)
  end
end
