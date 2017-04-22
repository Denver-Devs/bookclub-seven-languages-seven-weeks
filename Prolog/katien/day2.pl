% ['day2.pl'].

% Find:
% Some implementations of a Fibonacci series and factorials. How do they work?
% base cases - first and second Fibonacci numbers are 1, use ! to disable backtracking and prevent stack overflow
fib(1, 1) :- !.
fib(2, 1) :- !.

% Recursively finds the Nth Fibonacci number
fib(N, Result) :-
    N1 is N - 1, N2 is N - 2,
    % find previous two Fibonacci numbers
    fib(N1, N1Fib),
    fib(N2, N2Fib),
    % Result is the (N-1) Fibonacci number + the (N-2) Fibonacci number
    Result is N1Fib + N2Fib.

% base case - 1! is 1, disable backtracking
factorial(1, 1) :- !.
factorial(N, Result) :-
    N1 is N - 1,
    factorial(N1, R1),
    Result is N * R1.

% A real-world community using Prolog. What problems are they solving with it today?
% http://www.swi-prolog.org/forum

% If you’re looking for something more advanced to sink your teeth into, try these problems:
% An implementation of the Towers of Hanoi. How does it work?
% What are some of the problems of dealing with “not” expressions?
% Why do you have to be careful with negation in Prolog?

% Do:
% Reverse the elements of a list.

% base case - swap the elements in a two element list
doreverse([A,B], [B,A]).
% the reversed list is its reversed tail plus its head
doreverse([Head|Tail], Reverse) :-
    doreverse(Tail, ReverseTail),
    append(ReverseTail, [Head], Reverse).

% Find the smallest element of a list.
getsmallest([A, B], El) :- A < B, El = A.
getsmallest([A, B], El) :- A > B, El = B.

getsmallest([Head|Tail], El) :- getsmallest(Tail, R1), Head < R1, El = Head.
getsmallest([Head|Tail], El) :- getsmallest(Tail, R1), Head > R1, El = R1.

% Sort the elements of a list.
% We can use the built in sort...
% sort([1,2,3,4], [1,2,3,4]). % true

% or we can write our own naive sort
is_sorted([]).
is_sorted([A]).
is_sorted([H1|[H2|Tail]]) :- H1 =< H2, is_sorted([H2|Tail]).

takeout(A,[A|B],B).
takeout(A,[B|C],[B|D]) :- takeout(A,C,D).

perm([Head|Tail],Z) :- perm(Tail,W), takeout(Head,Z,W).
perm([],[]).

doSort(L, Sorted) :-
    perm(L, Sorted),
    is_sorted(Sorted).
