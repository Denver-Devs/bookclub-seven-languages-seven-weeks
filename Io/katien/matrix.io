# 5. Write a prototype for a two-dimensional list.
# The dim(x, y) method should allocate a list of y lists that are x elements long.
Matrix := List clone
Matrix dim := method(x, y,
    self = Matrix clone
    for (i, 0, y - 1, 1,
        l := list()
        for (j, 0, x - 1, 1,
            l append(nil)
        )
        self append(l);
    )
)

# set(x, y, value) should set a value
Matrix set := method(x, y, value,
    self at(y - 1) atPut(x - 1, value)
)

# and get(x, y) should return that value
Matrix get := method(x, y,
    self at(y - 1) at(x - 1)
)

// x and y length convenience methods
Matrix x := method(self at(0) size)
Matrix y := method(self size)

# print override for printing formatted matrix contents
Matrix print := method(
    writeln("MATRIX - (", self x, " x ", self y, ")")
    write("____________________")
    self foreach (i, vi,
        write("\n", i + 1, "| ")
        vi foreach (j, vj,
            write(vj, " ")
        )
    )
    writeln
    writeln("____________________")
    writeln
)

# 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.
Matrix transpose := method(
    new_matrix := Matrix dim((self y), (self x))
    for (i, 1, self x, 1,
        for (j, 1, self y, 1,
            new_matrix set(j, i, self get(i, j))
        )
    )
    new_matrix
)

# 7. Write the matrix to a file,
Matrix storeAsFile := method(
    f := File with("matrix.txt")
    f remove
    f openForUpdating

    f write(self x asString)
    f write(" ")
    f write(self y asString)
    f write("\n")

    self foreach(i, vi,
        vi foreach (j, vj,
            if (vj == nil,
                f write("nope "),
                f write(vj); f write(" ")
            )
        )
    )
    f close
)

# and read a matrix from a file.
Matrix readFromFile := method(
    f := File with("matrix.txt")
    f openForReading

    meta := f readLine split
    x := meta at(0) asNumber
    y := meta at(1) asNumber

    self = Matrix dim(x, y)

    data := f readLine split
    ptr := 0
    for (i, 1, x, 1,
        for (j, 1, y, 1,
            self set(i, j, if(data at(ptr)=="nope", nil, data at(ptr)))
            ptr = ptr + 1
        )
    )
    f close
    self
)






###########################################################
# I thought it would be neat to have this be interactive  #
###########################################################
writeln("Welcome to the matrix program.")
writeln("Enter the x dimension for the matrix you want to create")
x := File standardInput readLine asNumber
if (x isNan, Exception raise("Your matrix coordinates need to be numbers"))

writeln("Enter the y dimension for the matrix you want to create")
y := File standardInput readLine asNumber
if (y isNan, Exception raise("Your matrix coordinates need to be numbers"))

writeln("Creating ", x, " x ", y, " matrix")
matrix := Matrix dim(x, y)

writeln("To set a value at a location within the matrix, run: \n\t set <x> <y> <value>")
writeln("To get a value at a location within the matrix, run: \n\t get <x> <y>")
writeln("To view the entire matrix, run:\n\t view")
writeln("To save the matrix to a file, run: \n\t save")
writeln("To read the matrix from a file, run: \n\t read")
writeln("To quit the program, run: quit")

valid_commands := list("quit", "view", "set", "get", "save", "read", "transpose")
loop (
    input := File standardInput readLine asMutable strip split

    # parse command input
    command := input at(0)

    valid_commands contains(command) ifFalse(
        writeln("invalid command")
        continue
    )
    # handle non 0 argument commands
    if (command == "quit", exit)
    if (command == "view", matrix print)
    if (command == "transpose",
        matrix := matrix transpose
        writeln("print the transposed matrix")
        matrix println
    )


    # handle file input commands
    if (command == "read",
        "reading from ./matrix.txt" println
        matrix := Matrix readFromFile
    )
    if (command == "save",
        "writing to ./matrix.txt" println
        matrix storeAsFile
    )


    # parse and validate coordinate input
    xInput := if (input at(1) != nil, input at(1) asNumber, continue)
    yInput := if (input at(2) != nil, input at(2) asNumber, continue)
    val := input at(3)

    # validate coordinate input
    if ((xInput isNan) or (yInput isNan), writeln("Your matrix coordinates need to be numbers"))
    if (xInput > (matrix x) or (xInput <= 0), writeln(xInput, " is out of bounds"))
    if (yInput > (matrix y) or (yInput <= 0), writeln(yInput, " is out of bounds"))

    if (command == "set",
        writeln("Setting the value at (", xInput, ", ", yInput,") to ", val)
        matrix set(xInput, yInput, val)
    )
    if (command == "get",
        writeln("The value at (", xInput, ", ", yInput,") is ", matrix get(xInput, yInput))
    )
    writeln("____________________")
    writeln
)
