// Run from file with `io Day3-2.io`

# Override for Object to create a list; trivial since listing things out creates a list by default in Io
Object setSlot(
	"squareBrackets",
	method(
		call message arguments
	)
)

# Override for List to support reading elements with square bracket notation
List setSlot(
	"squareBrackets",
	method(
		self at(call message arguments first asString asNumber)
	)
)

listyMcListFace := ["one", "two", "three"]
listyMcListFace println
listyMcListFace[0] println
listyMcListFace[2] println
listyMcListFace[3] println