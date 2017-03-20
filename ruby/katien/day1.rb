# # STUDY
# 1. The Ruby API - http://ruby-doc.org/core-2.4.0/
# 2. Programming Ruby: The Pragmatic Pro- grammer’s Guide - http://ruby-doc.com/docs/ProgrammingRuby/
# 3. A method that substitutes part of a string - https://ruby-doc.org/core-1.9.3/String.html#method-i-sub
p "Katie Noland".sub("Katie", "Katherine")
puts
# 4. Information about Ruby’s regular expressions - https://ruby-doc.org/core-2.2.0/Regexp.html
# 5. Information about Ruby’s ranges - https://ruby-doc.org/core-2.2.0/Range.html
#
# # DO
# 1. Print the string “Hello, world.”
puts "Hello World"
puts
# 2. For the string “Hello, Ruby,” find the index of the word “Ruby.” - 7
p "Hello, Ruby,".index("Ruby")
puts
# • Print your name ten times.
10.times { puts "Katie Noland" }
puts
# • Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
(1..10).each {|n| puts "This is sentence number #{n}," }
puts
# • Run a Ruby program from a file. - `ruby ./myfile.rb`


# Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high.
# (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)

# Extend String class with number helper
class String
  def is_number?
    true if Float(self) rescue false
  end
end

# collect and validate input
puts "Pick a number between 0 and 9."
number = gets

if !number.is_number?
    puts "A NUMBER"
    exit(1)
end

number = number.to_i
if number < 0 || number > 9
    puts "BETWEEN ZERO AND NINE"
    exit(1)
end

# compare input to random
puts "You picked #{number}"
random = rand(10)

if number == random
    puts "We also picked #{random}, you win!"
else
    puts "We picked #{random}, you were #{number < random ? 'too low' : 'too high'}."
end
