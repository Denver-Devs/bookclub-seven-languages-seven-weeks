// Run from file with `io Day2-7.io`

// Run 2-6 file first for 2dList class
doFile("Day2-6.io")
"------\n" println

filePath := "./Day2-7.txt"

"Day 2-7 Lines:\n" println

myList1 := 2dList clone
myList1 dim(2, 3)
myList1 set(0, 0, 1)
myList1 set(1, 0, 2)
myList1 set(0, 1, 3)
myList1 set(1, 1, 4)
myList1 set(0, 2, 5)
myList1 set(1, 2, 6)
"Original List:" println
myList1 myLists println

dataFile := File open(filePath)
dataFile write(myList1 serialized)
dataFile close

"" println
myListRead := doFile(filePath)
"File List:" println
myListRead myLists println

"\nAre they the same?" println
(myListRead myLists == myList1 myLists) println