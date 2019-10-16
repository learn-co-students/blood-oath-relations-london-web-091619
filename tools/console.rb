require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("Boys", "Burnley" , 1996 , "Come on you boys")
c2 = Cult.new("Girls", "Manchester" , 2000 , "Come on you girls")
c3 = Cult.new("Trans", "London", 2002 , "Come on you trans")
c3 = Cult.new("Trans and Mash", "London", 2006 , "Come on you mincers")

f1 = Follower.new("Jason", 24, "Bounce")
f2 = Follower.new("Stan", 27, "Collect")
f3 = Follower.new("Nick", 25, "Munch")

b1 = BloodOath.new(f2, c3)
b2 = BloodOath.new(f1, c2)
b3 = BloodOath.new(f3, c1)
b4 = BloodOath.new(f1, c3)
b5 = BloodOath.new(f3, c3)
b6 = BloodOath.new(f3, c2)

Cult.cult_locations





binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
