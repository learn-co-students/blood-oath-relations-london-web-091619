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

  def self.most_active
    all.max_by { |follower| follower.cults.count }
  end

  def self.top_ten
    all.sort_by { |follower| follower.cults.count }.reverse.last(10)
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
    if age < cult.minimum_age
      puts 'Sorry, you are too young!'
      return false
    end

    BloodOath.new(cult: cult, follower: self)
  end

  def my_cults_slogans
    cults.map(&:slogan)
  end

  def fellow_cult_members
    cults.map(&:followers).flatten.uniq.reject { |follower| follower.eql?(self) }
  end
end
