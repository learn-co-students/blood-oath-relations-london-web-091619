require_relative '../config/environment.rb'


def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("cult1", "france", 2000, "slogan1")
cult2 = Cult.new("cult2", "france", 2000, "slogan2")
cult3 = Cult.new("cult3", "notfrance", 1999, "slogan3")

follower1 = Follower.new("follower1", 20, "motto1")
follower2 = Follower.new("follower2", 10, "motto2")
follower3 = Follower.new("follower3", 100, "motto3")

follower2.join_cult(cult3)
follower2.join_cult(cult2)
follower3.join_cult(cult3)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
