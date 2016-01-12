class Dice
  DICE = [2, 4, 6, 8, 10, 20, 100]

  DICE.each do |sides|
   define_method("d#{sides}") do |num|
     sum = 0
     num.times { sum += (rand(1..sides)) }
     sum
   end
 end
end

#create a method that rolls multiple dice but compares the values instead of adding them.
# gets rid of the lowest or highest one based on need.
# creats an array of dice rolls, takes the lowest out of the array.
