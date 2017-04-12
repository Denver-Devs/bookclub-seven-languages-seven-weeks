% The Erlang language’s official site -https://www.erlang.org/
% Official documentation for Erlang’s function library - http://erlang.org/doc/man/STDLIB_app.html
% The documentation for Erlang’s OTP library - http://erlang.org/doc/
% Do:
% Write a function that uses recursion to return the number of words in a string.
% Write a function that uses recursion to count to ten.
% Write a function that uses matching to selectively print “success” or “error: message” given input of the form {error, Message} or suc- cess.

-module(day1).

-export([wordCount/1]).
-export([countToTen/0]).
-export([countToN/1]).
-export([response/1]).

wordCount([]) -> 0;
wordCount(Str) ->
    [_|Tail] = string:tokens(Str, " "),
    TailString = string:join(Tail, " "),
    wordCount(TailString) + 1.
% day1:wordCount("a test sentence with some words").

countToTen() -> countToN(10).
countToN(N) -> counter(0, N).

counter(A, A) -> A;
counter(Start, Finish) ->
    I = Start+ 1,
    counter(I, Finish).

% day1:countToTen().
% day1:countToN(890).


response(success) ->
    io:format("success"),
    io:format("~n");
response({ error, Message }) ->
    io:format("error: "),
    io:format(Message),
    io:format("~n").
% day1:response(success).
% day1:response({ error, "404 not found" }).
