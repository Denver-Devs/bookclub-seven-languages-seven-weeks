secret = rand(10)
puts 'Enter your guess!'

guess = gets.to_i

unless guess.eql? secret
  puts 'Too low!' if guess < secret
  puts 'Too high!' if guess > secret
  guess = gets.to_i
end

puts 'Winner winner, tofu dinner!'
