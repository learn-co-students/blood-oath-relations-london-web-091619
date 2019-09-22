require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult = Cult.new(name: 'woo', location: 'somewhere', slogan: 'join us!')
cult2 = Cult.new(name: 'hohoho', location: 'north pole', slogan: 'merry christmas!')
cult3 = Cult.new(name: 'hehehe', location: 'north pole', slogan: 'merry xmas!')
joe = Follower.new(name: 'Joe', age: 17, life_motto: 'yolo')
steve = Follower.new(name: 'Steve', age: 21, life_motto: 'yolo')
chris = Follower.new(name: 'chris', age: 29, life_motto: 'yolo')
young = Follower.new(name: 'chris', age: 12, life_motto: 'yolo')
steve.join_cult(cult)
joe.join_cult(cult2)
joe.join_cult(cult)
chris.join_cult(cult2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
