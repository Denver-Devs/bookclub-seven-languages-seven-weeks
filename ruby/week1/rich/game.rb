num = rand(10) + 1
puts 'Guess a number from 1 to 10'
puts 'Nope, try again.' while num != gets.to_i
puts "Yes, #{num} is right! Good jorb!"