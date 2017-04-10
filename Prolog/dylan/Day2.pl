% Compile with `gplc Day2.pl`; run with `./Day2` (might need to chmod the executable)

% Part 1 - Reverse elements of a list

reversal([], []).                                       % Base case - empty list reverses to itself
reversal([Head|Tail], List) :-                          % Recursive case - backwards Tail concatenated with Head must form input List
    reversal(Tail, BackwardsTail),
    append(BackwardsTail, [Head], List).


% Part 2 - Find minimum element in a list

smallest([Minimum], Minimum).                           % Base case - list of one element is its own Minimum
smallest([Head1|[Head2|Tail]], CurrentMinimum) :-       % Recursive case 1 - element at start of remaining list is smaller than second element in remaining list
    Head1 =< Head2,                                     % Prolog LTE is backwards >:(
    smallest([Head1|Tail], CurrentMinimum).
smallest([Head1|[Head2|Tail]], CurrentMinimum) :-       % Recursive case 2 - element at start of remaining list is larger than second element in remaining list
    Head1 > Head2,
    smallest([Head2|Tail], CurrentMinimum).


% Part 3 - Sort elements in a list

mergesort([], []).                                      % Base case - empty list is sorted
mergesort([A], [A]).                                    % Base case 2 - Single element is sorted too
mergesort(List, SortedList) :-
    List = [_,_|_],
    halve(List, FirstHalf, SecondHalf),
    mergesort(FirstHalf, SortedFirstHalf),
    mergesort(SecondHalf, SortedSecondHalf),
    merge(SortedFirstHalf, SortedSecondHalf, SortedList).
merge([], List, List).                                  % Base case for merge - empty list and list equals list
merge(List, [], List).                                  % Base case above, rearranged
merge([Head1|Tail1], [Head2|Tail2], [Head1|Tail]) :-    % Recursive case 1 - Head1 is LTE Head2 so merging proceeds with Tail1 ahead of Head2 and Tail2
    Head1 =< Head2,
    merge(Tail1, [Head2|Tail2], Tail).
merge([Head1|Tail1], [Head2|Tail2], [Head2|Tail]) :-    % Recursive case 2 - Head1 is GTE Head2 so merging proceeds with Head1 ahead of Tail1 and Tail2
    Head1 > Head2,
    merge([Head1|Tail1], Tail2, Tail).

halve(L,A,B):-hv(L,[],A,B).                             % This halving code shamelessly lifted from http://kti.mff.cuni.cz/~bartak/prolog/recursion.html   
hv(L, L, [], L).      % for lists of even length
hv(L, [_|L], [], L).  % for lists of odd length
hv([H|T], Acc, [H|L], B) :-
    hv(T, [_|Acc], L, B).