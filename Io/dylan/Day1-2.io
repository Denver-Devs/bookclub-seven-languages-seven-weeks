// Run from file with `io Day1-2.io`

Day1Object := Object clone do(
	insult := method(
		"You must have been born on a highway. That's where most accidents happen." println
	)
	compliment := method(
		"I bet you make babies smile." println
	)
	passiveaggression := method(
		"Dear Thief: While I appreciate your initiative and hard work, I'd like to suggest you not break our window. There is an H&R Block across the street and I'm certain their computers are much nicer than ours. I live in the neighborhood and would appreciate you not stealing from a local non-profit that provides services to soldiers and veterans. Also, I will shoot you in the fucking face. Thanks! -Management" println
	)
)

Day1Object getSlot("insult") call
Day1Object getSlot("compliment") call
Day1Object getSlot("passiveaggression") call