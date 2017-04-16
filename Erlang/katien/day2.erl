-module(day2).
-export([valForKey/2]).
-export([totals/1]).
-export([ticTacToe/1]).

% Consider a list of keyword-value tuples, such as [{erlang, "a functional language"}, {ruby, "an OO language"}].
% Write a function that accepts the list and a keyword and returns the associated value for the keyword.
valForKey([], _) -> undefined;
valForKey([{ SearchKey, Value }|_], SearchKey) -> Value;
valForKey([_|Tail], SearchKey) -> valForKey(Tail, SearchKey).
% Family = [
%     { kate, 20 },
%     { james, 16 },
%     { cat, 13 },
%     { matthew, 11 }
% ].
% day2:valForKey(Family, kate).
% day2:valForKey(Family, mike).

% Consider a shopping list that looks like [{item quantity price}, ...].
% Write a list comprehension that builds a list of items of the form [{item total_price}, ...], where total_price is quantity times price.
totals(List) -> [ { Item, Qty * Price } || { Item, Qty, Price } <- List].
% Groceries = [
%     { cereal, 3, 5.49},
%     { carrots, 570, 0.10},
%     { apples, 5, 0.50},
%     { peanutButter, 1, 5.00}
% ].
% day2:totals(Groceries).

% Bonus problem:
% Write a program that reads a tic-tac-toe board presented as a list or a tuple of size nine.
% Return the winner (x or o) if a winner has been determined,
% cat if there are no more possible moves, or no_winner if no player has won yet.
threeInARow([empty, empty, empty|Tail]) -> threeInARow(Tail);
threeInARow([I, I, I|_]) -> I;
threeInARow([_, _, _|Tail]) -> threeInARow(Tail);
threeInARow([]) -> false.

ticTacToe(Rows) ->
    [A1, A2, A3, B1, B2, B3, C1, C2, C3] = Rows,
    Cols = [A1, B1, C1, A2, B2, C2, A3, B3, C3],
    Diags = [A1, B2, C3, A3, B2, C1],

    IsValid = lists:all(fun(I) -> lists:member(I, [x,o,empty]) end, Rows),

    case threeInARow(lists:append([Rows, Cols, Diags])) of
        x when IsValid ->
            io:format("x won~n");
        o when IsValid ->
            io:format("o won~n");
        false when IsValid ->
            io:format("Nobody has won yet~n");
        _ ->
            io:format("Invalid board, pass in a list of 9 x's, o's, and empty's.~n")
    end.

% day2:ticTacToe([
%     x, o, o,
%     o, x, o,
%     o, o, x
% ]).
%
% day2:ticTacToe([
%     x, o, o,
%     o, o, o,
%     o, o, x
% ]).
%
% day2:ticTacToe([
%     o, o, x,
%     empty, empty, o,
%     o, o, o
% ]).
%
% day2:ticTacToe([
%     empty, empty, empty,
%     empty, empty, empty,
%     empty, empty, empty
% ]).
%
% day2:ticTacToe([
%     o, empty, empty,
%     o, empty, empty,
%     o, empty, empty
% ]).
%
% day2:ticTacToe([
%     nope, nope, nope,
%     o, empty, empty,
%     o, empty, empty
% ]).
