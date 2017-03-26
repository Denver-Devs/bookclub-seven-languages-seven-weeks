def intro
  puts 'Hello! What is your name?'
  user = gets.chomp
  puts "Ok, so your name is #{user}. Did I spell that right?"
  answer = gets.chomp
  if /y/ =~ answer
    puts "Wonderful. Nice to meet you, #{user}."
  end
  if /n/ =~ answer
    puts 'My apologies. How do you spell that, again?'
    user = gets.chomp
    puts "Great. #{user}, it is! Nice to meet you."
  end
  sleep(1)
  puts 'Want to play a game?'
  answer = gets.chomp
  if /y/ =~ answer
    guessing_game(user)
  end
  if /n/ =~ answer
    puts "Oh, ok, #{user}. Well, have a good day!"
  end
end

def guessing_game(user)
  puts 'I\'m thinking of a number between 1 and 9. Can you guess what it is?'
  random_number = rand(10)
  guess = gets.chomp
  guess = guess.to_i
  if random_number == guess
    puts "Wow, #{user}, you guessed that quickly. Good job!"
  end
  if random_number < guess
    puts "Well, #{user}, you guessed a little too high."
  end
  if random_number > guess
    puts "Oops, #{user}, not quite high enough."
  end
  outro(user)
end

def outro(user)
  puts 'Want to try again?'
  answer = gets.chomp
  if /y/ =~ answer
    puts 'Great!'
    guessing_game
  end
  if /n/ =~ answer
    puts 'Oh, ok...'
    sleep(1)
    puts 'Well, goodbye, then!'
  end
end

intro
