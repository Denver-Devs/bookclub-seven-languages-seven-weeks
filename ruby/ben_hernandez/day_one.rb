puts 'Hello, world'

puts 'Hello, Ruby'.index 'Ruby'

10.times { || puts 'Ben Hernandez' }

10.times { |i| puts "This is sentence number #{i + 1}" }

def guesser
  number = rand(10) + 1
  puts 'Guess a number and press enter'
  input = gets.chomp.to_i
  input = check_number(input, number) until input == number
  puts "you correctly guessed #{number}"
end

def check_number(input, number)
  if input < number
    puts 'higher'
  else
    puts 'lower'
  end
  gets.chomp.to_i
end

guesser
