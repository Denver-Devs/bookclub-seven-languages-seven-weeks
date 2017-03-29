// Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

List myAverage := method(self reduce(sum, x, if(x type == "Number", sum + x, Exception raise("\"#{x}\" is not something I can average Try again with a Number." interpolate ))) / self size)

myList := list(70, 2, 3)
myList myAverage println // 25

myList = list(43, 91, "bananana")
myList myAverage println // Exception
