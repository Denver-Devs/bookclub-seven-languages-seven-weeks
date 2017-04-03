// Run from file with `io Day2-5.io`

2dList := Object clone

2dList setSlot(
	"init",
	method(
		self myLists := list
	)
)

2dList setSlot(
	"dim",
	method(x, y,
		for(i, 1, y, 1,
			myList := list setSize(x)
			self myLists push(myList)
		)
	)	
)

2dList setSlot(
	"set",
	method(x, y, value,
		self myLists at(y) atPut(x, value)
	)
)

2dList setSlot(
	"get",
	method(x, y,
		self myLists at(y) at(x)
	)
)

"\nDay 2-5 Lines:\n" println
myList1 := 2dList clone
myList2 := 2dList clone
myList3 := 2dList clone
myList4 := 2dList clone
(myList1 dim(3, 3)) println
(myList2 dim(2, 4)) println
(myList3 dim(4, 2)) println
(myList4 dim(5, 1)) println
"" println
myList1 set(1, 1, 6)
myList1 myLists println
myList1 get(1, 1) println