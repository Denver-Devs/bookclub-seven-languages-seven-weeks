// Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.
// Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.
// Write the matrix to a file, and read a matrix from a file.
// TODO: range check on get/set

TwoDimList := Object clone do(
  init := method(
    self lists := List clone
  )

  dim := method(x, y,
    self lists setSize(y)
    self lists mapInPlace(v, v = List clone setSize(x))
    self
  )

  set := method(x, y, v, self lists at(y) atPut(x, v))

  get := method(x, y, self lists at(y) at(x))

  println := method(
    self lists foreach(y, xs,
      xs foreach(x, v,
        if(x == 0 or x == xs size, "|" print)
        " #{get(x, y)} |" interpolate print
      )
      "" println
    )
  )

  transpose := method(
    newList := TwoDimList clone dim(self lists size, self lists at(0) size)
    self lists foreach(y, xs,
      xs foreach(x, v,
        newList set(y, x, v)
      )
    )
    newList
  )

  toFile := method(fileName, File with(fileName) remove open write(self serialized) close)

  fromFile := method(fileName, doFile(fileName))
)

myList := TwoDimList fromFile("list.txt")
myList println

myList get(1, 1) print; myList get(0, 0) print; myList get(1, 0) println

transposedList := myList transpose
transposedList println

transposedList toFile("list.txt")
