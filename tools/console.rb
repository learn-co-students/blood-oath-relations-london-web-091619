require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult = Cult.new(name: 'woo', location: 'somewhere', slogan: 'join us!')
cult2 = Cult.new(name: 'hohoho', location: 'north pole', slogan: 'merry christmas!')
joe = Follower.new(name: 'Joe', age: 17, life_motto: 'yolo')
steve = Follower.new(name: 'Steve', age: 21, life_motto: 'yolo')

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
