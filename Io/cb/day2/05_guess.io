// Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.

secret := (Random value(99) + 1) floor
count := 10

"#{count}. Guess my number (1 - 100)\n> " interpolate print

input := File standardInput readLine asNumber
count = count - 1
if(input != secret, "#{count}. NOPE try again\n> " interpolate print; diff := (input - secret) abs)

while (input != secret and count > 0,
  input := File standardInput readLine asNumber
  count = count - 1
  newdiff := (input - secret) abs
  if(newdiff > diff, "#{count}. colder...\n> " interpolate print, "#{count}. warmer!\n> " interpolate print)
  diff = newdiff
)

if(count > 0, "WINNER IS YOU!" println, "GAME OVER! Ran out of guesses :(" println)
