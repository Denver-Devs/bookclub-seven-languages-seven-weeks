% Consider a list of keyword-value tuples, such as [{erlang, "a func- tional language"}, {ruby, "an OO language"}]. Write a function that ac- cepts the list and a keyword and returns the associated value for the keyword.
% Consider a shopping list that looks like [{item quantity price}, ...]. Write a list comprehension that builds a list of items of the form [{item total_price}, ...], where total_price is quantity times price.
% Bonus problem:
% Write a program that reads a tic-tac-toe board presented as a list or a tuple of size nine. Return the winner (x or o) if a winner has been determined, cat if there are no more possible moves, or no_winner if no player has won yet.

-module(day2).

-export([finder/2]).
-export([getCost/1]).
-export([threeInARow/1]).
-export([ticTacToe/1]).

finder(SearchKey, List) ->
    [Val || { _, Val } <- lists:filter(fun({ ItemKey, _ }) ->
        SearchKey == ItemKey
    end, List)].
% Languages = [
%     { erlang, "a functional language" },
%     { io, "a prototype language" },
%     { ruby, "an OO language" }
% ].
% day2:finder(erlang, Languages).

getCost(Groceries) ->
    [{ Name, Qty * Price} || { Name, Qty, Price } <- Groceries].
% Groceries = [
%     { cereal, 4, 3 },
%     { milk, 2, 5 },
%     { carrots, 10, 0.2 }
% ].
% day2:getCost(Groceries).

threeInARow([_|[]]) -> true;
threeInARow([H1,H2|T]) ->
    (H1 == H2) and threeInARow([H2|T]).

ticTacToe([A1, A2, A3, B1, B2, B3, C1, C2, C3]) ->
    Row1 = threeInARow([A1, A2, A3]),
    Row2 = threeInARow([B1, B2, B3]),
    Row3 = threeInARow([C1, C2, C3]),

    Col1 = threeInARow([A1, B1, C1]),
    Col2 = threeInARow([A2, B2, C2]),
    Col3 = threeInARow([A3, B3, C3]),

    D1 = threeInARow([A1, B2, C3]),
    D2 = threeInARow([A3, B2, C1]),
    Finished = lists:any(fun(Val) -> Val == none end, [A1, A2, A3, B1, B2, B3, C1, C2, C3]),

    if
        Row1 -> A1;
        Row2 -> B1;
        Row3 -> C1;
        Col1 -> A1;
        Col2 -> A2;
        Col3 -> A3;
        D1 -> A1;
        D2 -> A3;
        Finished -> "No winner yet";
        true -> "There are no more possible moves"
    end.

% % x
% day2:ticTacToe([
%     x, x, x,
%     o, o, none,
%     x, o, x
% ]).

% % o
% day2:ticTacToe([
%     x, x, o,
%     o, o, none,
%     o, o, x
% ]).

% % x
% day2:ticTacToe([
%     x, x, o,
%     x, o, none,
%     x, o, x
% ]).

% % "There are no more possible moves"
% day2:ticTacToe([
%     x, o, x,
%     o, x, o,
%     o, x, o
% ]).

% % "No winner yet"
% day2:ticTacToe([
%     x, o, x,
%     o, none, o,
%     o, x, o
% ]).
