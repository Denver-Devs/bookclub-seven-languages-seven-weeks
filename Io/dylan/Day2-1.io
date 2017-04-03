// Run from file with `io Day2-1.io`

fib := method(arg,
	if(arg == 0,
	1, 
	if(arg == 1, 
		1, 
		fib(arg - 2) + fib(arg - 1)))
)

fib(0) println
fib(1) println
fib(2) println
fib(20) println