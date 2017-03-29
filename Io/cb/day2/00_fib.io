// A Fibonacci sequence starts with two 1s. Each subsequent number is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

fib_recursive := method(n,
  if (n < 3, 1, fib_recursive(n - 1) + fib_recursive(n - 2))
)

fib_iterative := method(
  x := 0; y := 0; sum := 1
  for(i, 2, doMessage(call message argAt(0)), x = y; y = sum; sum = x + y)
  sum
)

"\n## Recursive means to _cursive_ yet again\n" println
for(i, 1, 10, "item #{i} = #{fib_recursive(i)}" interpolate println)

"\n## Iterative fibs\n" println
for(i, 1, 10, "item #{i} = #{fib_iterative(i)}" interpolate println)
