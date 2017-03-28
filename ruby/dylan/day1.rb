puts "Guess a number between 1 and 10"
randNum = rand(10) + 1
guess = gets.to_i
puts "You guessed #{guess}"
if guess < randNum 
	puts "Too low"
elsif guess > randNum 
	puts "Too high"
else 
	puts "Got it!"
end