// Run from file with `io Day2-6.io`

// Run 2-5 file first for 2dList class
doFile("Day2-5.io")
"------\n" println

2dList setSlot(
	"transpose",
	method(
		transposedList := 2dList clone 
		transposedList dim(self myLists size, self myLists at(0) size)
		self myLists foreach(i, mySublist,
			mySublist foreach(j, value,
				transposedList set(i, j, value)
			)
		)
		transposedList
	)
)

"Day 2-6 Lines:\n" println
myList1 := 2dList clone
myList1 dim(2, 3)
myList1 myLists println
myList1 set(0, 0, 1)
myList1 set(1, 0, 2)
myList1 set(0, 1, 3)
myList1 set(1, 1, 4)
myList1 set(0, 2, 5)
myList1 set(1, 2, 6)
myList1 myLists println
(myList1 transpose) myLists println