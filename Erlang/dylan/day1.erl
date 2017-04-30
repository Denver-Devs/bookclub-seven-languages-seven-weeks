-module(day1).
-export([stringwords/1]).
-export([tencount/0]).
-export([matcher/1]).


% Function that uses recursion to return the number of words in a string.
stringwords([]) -> 0;
stringwords([32|Tail]) -> stringwords(Tail);
stringwords(Whitespace) -> skip(Whitespace).

skip([]) -> 1;
skip([32|Tail]) -> 1 + stringwords(Tail);
skip([_|Tail]) -> skip(Tail).


% Function that uses recursion to count to ten.
tencount() -> recursiveCount(1).

recursiveCount(10) -> 10;
recursiveCount(N) -> io:format("~p~n",[N]), recursiveCount(N + 1).


% Function that uses matching to selectively print "success" or "error: message" given input of the form {error, Message} or success.
matcher(success) -> io:format("success~n");
matcher({error, Message}) -> io:format("error: ~p~n", [Message]).