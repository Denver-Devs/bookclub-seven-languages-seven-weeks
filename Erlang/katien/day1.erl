% The Erlang language’s official site -https://www.erlang.org/
% Official documentation for Erlang’s function library - http://erlang.org/doc/man/STDLIB_app.html
% The documentation for Erlang’s OTP library - http://erlang.org/doc/
% Do:
% Write a function that uses recursion to return the number of words in a string.

-module(day1).
-export([wordCount/1]).
-export([countToTen/0]).
-export([response/1]).

removeConsecutiveSpaces([]) -> [];
removeConsecutiveSpaces([32,32|T]) -> removeConsecutiveSpaces([32|T]);
removeConsecutiveSpaces([H|T]) -> [H|removeConsecutiveSpaces(T)].

removeLeadingSpaces([32|T]) -> removeLeadingSpaces(T);
removeLeadingSpaces([H|T]) -> [H|T].

removeTrailingSpaces(String) -> lists:reverse(removeLeadingSpaces(lists:reverse(String))).

countSpaces([], Ctr) -> Ctr + 1;
countSpaces([32|T], Ctr) -> countSpaces(T, Ctr + 1);
countSpaces([_|T], Ctr) -> countSpaces(T, Ctr).

wordCount(String) ->
    NoLeadingSpaces = removeLeadingSpaces(String),
    io:format("Removing leading spaces: ~p~n", [NoLeadingSpaces]),
    NoTrailingSpaces = removeTrailingSpaces(NoLeadingSpaces),
    io:format("Removing trailing spaces: ~p~n", [NoTrailingSpaces]),
    NoConsecutiveSpaces = removeConsecutiveSpaces(NoTrailingSpaces),
    io:format("Removing consecutive spaces: ~p~n", [NoConsecutiveSpaces]),
    countSpaces(NoConsecutiveSpaces, 0).
% day1:wordCount("     a test string      with spaces    ").
% or you could just use string:words like a sane person...
% string:words("     a test string      with spaces    ").

% Write a function that uses recursion to count to ten.
counter(C, E) ->
    if
        C < E ->
            io:format("counter: ~p~n",[C]),
            counter(C + 1, E);
        C == E ->
            io:format("counter: ~p~n",[C]);
        C > E ->
            io:format("Counter (~p) must be less than goal (~p)~n",[C, E])
    end.

countToTen() -> counter(0,10).
% day1:countToTen().

% Write a function that uses matching to selectively print “success” or “error: message” given input of the form {error, Message} or suc- cess.
response(success) -> io:format("success~n");
response({ error, Message }) -> io:format("error: ~p~n", [Message]).
% day1:response(success).
% day1:response({ error, "404 not found" }).
