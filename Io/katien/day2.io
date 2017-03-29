# 1. A Fibonacci sequence starts with two 1s. Each subsequent num- ber is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.
# looping
fib := method(n,
    fibs := list(1, 1)
    for (i, 1, n-2, 1,
        fibs append(fibs at(i) + fibs at(i - 1))
    )
    fibs at(n - 1)
)

fib(1) println // 1
fib(4) println // 3
fib(12) println // 144
writeln

# recursive
fibR := method(n,
    if (n <= 2, 1, fib(n - 1) + fib(n - 2))
)

fibR(1) println // 1
fibR(4) println // 3
fibR(12) println // 144
writeln

# 2. How would you change / to return 0 if the denominator is zero?
originalDivisionMethod := Number getSlot("/")
Number / := method(n, if (n == 0, 0, self originalDivisionMethod(n)))

writeln("3/4 = ", 3/4)
writeln("3/0 = ", 3/0)
writeln

# 3. Write a program to add up all of the numbers in a two-dimensional
# array.
List sum := method(
    total := 0
    self foreach (i, vi,
        if (vi type == "List",
            vi foreach (j, vj,
                total = total + vj
            ),
            Exception raise ("That's not a nested list.")
        )
    )
    total
)

nestedArr := list(
    list(1,2,3,4,5,6,7,8,9),
    list(1,2,3,4,5,6,7,8,9),
    list(1,2,3,4,5,6,7,8,9)
)
nestedArr sum println

notNestedArr := list(1,2,3)
e := try (notNestedArr sum println)
e catch (Exception, writeln(e error))
writeln

# 4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)
List myAverage := method(
    if (self size == 0, Exception raise("This list is empty."))
    total := 0
    self foreach (i, v,
        if (v type == "Number",
            total = total + v,
            Exception raise("That's not a Number.")
        )
    )
    total / self size
)
someNumbers := list(1,2,3,4,5,6,7,8,90)
someNumbers myAverage println

notNumbers := list("nope")
e := try (notNumbers myAverage println)
e catch (Exception, writeln(e error))

empty := list()
e := try (empty myAverage println)
e catch (Exception, writeln(e error))
writeln

# 8. Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.
"Guess a number between 1 and 100" println

r := Random value(0, 100) ceil
# uncomment for testing
# writeln("The number is: ", r)
prev := nil

for (i, 1, 10, 1,
    if (i != 1 , writeln("Guess again"))
    input := File standardInput readLine asNumber
    if (input isNan, Exception raise("That's not a Number."))

    if (input != r,
        if (prev == nil) then (
            prev = input;
            continue
        ) elseif ((input - r) abs == (prev - r) abs) then (
            writeln("...")
        ) elseif ((input - r) abs < (prev - r) abs) then (
            writeln("Hotter")
        ) elseif ((input - r) abs > (prev - r) abs) then (
            writeln("Colder")
        )
        prev = input,

        break
    )
)

if (input == r,
    writeln("Got it!"),
    writeln("Too many guesses.")
)
