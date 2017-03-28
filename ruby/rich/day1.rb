# Print the string “Hello, world.”
puts 'Hello, world'

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
'Hello, Ruby'.index('Ruby') # => 7

# Print your name ten times.
10.times {puts 'Rich'}

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
10.times { |i| puts "This is sentence number #{i + 1}," }

# Run a Ruby program from a file.
#ruby day1.rb

# Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess the number, telling the player whether the guess is too low or too high. (Hint: rand(10) will generate a random number from 0 to 9, and gets will read a string from the keyboard that you can translate to an integer.)

puts 'Shall we play a game?'
num = rand(10) + 1
puts 'Guess a number from 1 to 10'
puts 'Nope, try again.' while num != gets.to_i
puts "Yes, #{num} is right! Good jorb!"
