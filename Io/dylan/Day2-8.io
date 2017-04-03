// Run from file with `io Day2-8.io`

"Guess a number from 1 to 100:" println
randomNum := (Random value(99) + 1) floor
guessCount := 0
previousGuess := 0

while(guessCount < 10,
	userInput := File standardInput readLine asNumber
	if(userInput < 1 or userInput > 100,
		"That's not a number between 1 and 100!" println,
		if(userInput == randomNum,
			"Correct!" println
			break,
			guessDist := (randomNum - userInput) abs
			prevDist := (randomNum - previousGuess) abs
			if(guessDist == prevDist,
				"About the same, try again!" println,
				if(guessDist > prevDist,
					"Colder, try again!" println,
					"Hotter, try again!" println
				)
			)
		)
	)
	guessCount = guessCount + 1
	previousGuess = userInput
)

if(guessCount >= 10,
	"Too many guesses, you lose!" println
	"The answer was #{randomNum}." interpolate println
)