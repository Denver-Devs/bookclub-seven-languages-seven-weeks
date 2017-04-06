// Run from file with `io Day2-4.io`

List setSlot(
	"myAverage",
	method(
		self foreach(i, arg, if(arg type != "Number", Exception raise("Non-number found, terminating myAverage")))
		if(self size == 0, "Empty list :(", self sum / self size)
	)
)

list(1,3,5,9) myAverage println
list() myAverage println
list(1, "one", 2, "potato") myAverage println