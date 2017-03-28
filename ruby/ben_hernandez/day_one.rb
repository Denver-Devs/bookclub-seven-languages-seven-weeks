puts "Hello, world"

puts "Hello, Ruby".index 'Ruby'

10.times { || puts 'Ben Hernandez'}

10.times { |i| puts "This is sentence number #{i + 1}"}

def guesser
    number = rand(10) + 1
    input = nil
    puts 'Guess a number and press enter'
    input = gets.chomp.to_i
    while (input != number) do
        if input < number then
            puts 'higher'
        else
            puts 'lower'
        end
        input = gets.chomp.to_i
    end
    puts "you correctly guessed #{number}"
end

guesser