// Run from file with `io Day2-2.io`
// It was tricky for me to figure out, but only B is passed to the division function in an expression like A / B.
// Therefore the division function only gets the denominator and the code is way simpler.

Number setSlot(
	"originalDiv",
	Number getSlot("/")
)

Number setSlot(
	"/",
	method(denom,
		if(denom == 0, 0, originalDiv(denom))
	)
)

(5 / 6) println
(3 / 4) println
(1 / 2) println
(1 / 0) println
(0 / 1) println
(2 / 5) println
(5 / 0) println