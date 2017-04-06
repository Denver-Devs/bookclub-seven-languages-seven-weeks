% Find:
% Prolog has some input/output features as well. Find print predicates that print out variables.
% http://www.swi-prolog.org/pldoc/man?section=format

% Find a way to use the print predicates to print only successful solutions. How do they work?
% Doesn't the print predicate only print successful solutions if you bind your variables and specify all subgoals before you call it?
even(N, Even) :-
    0 is mod(N, 2),
    print(N), % only prints if N was successfully bound
    Even = true.

% Do:
% Modify the Sudoku solver to work on six-by-six puzzles (squares are 3x2) and 9x9 puzzles.
% Make the Sudoku solver print prettier solutions.
valid_numbers([]).
valid_numbers([Head|Tail]) :-
    member(Head, [1, 2, 3, 4, 5, 6, 7, 8, 9]),
    valid_numbers(Tail).

no_duplicates([]).
no_duplicates([Head|Tail]) :-
    sort(Head, SortedHead),
    length(Head, A),
    length(SortedHead, B),
    A = B,
    no_duplicates(Tail).

check_rows([]).
check_rows([I1, I2, I3, I4, I5, I6, I7, I8, I9|Tail]) :-
    no_duplicates([[I1, I2, I3, I4, I5, I6, I7, I8, I9]]),
    check_rows(Tail).

sudoku(Puzzle, Solution) :-
    Puzzle = [
        S11, S12, S13, S14, S15, S16, S17, S18, S19,
        S21, S22, S23, S24, S25, S26, S27, S28, S29,
        S31, S32, S33, S34, S35, S36, S37, S38, S39,
        S41, S42, S43, S44, S45, S46, S47, S48, S49,
        S51, S52, S53, S54, S55, S56, S57, S58, S59,
        S61, S62, S63, S64, S65, S66, S67, S68, S69,
        S71, S72, S73, S74, S75, S76, S77, S78, S79,
        S81, S82, S83, S84, S85, S86, S87, S88, S89,
        S91, S92, S93, S94, S95, S96, S97, S98, S99
    ],
    valid_numbers(Puzzle),
    check_rows(Puzzle),

    C1 = [S11, S21, S31, S41, S51, S61, S71, S81, S91],
    C2 = [S12, S22, S32, S42, S52, S62, S72, S82, S92],
    C3 = [S13, S23, S33, S43, S53, S63, S73, S83, S93],

    C4 = [S14, S24, S34, S44, S54, S64, S74, S84, S94],
    C5 = [S15, S25, S35, S45, S55, S65, S75, S85, S95],
    C6 = [S16, S26, S36, S46, S56, S66, S76, S86, S96],

    C7 = [S17, S27, S37, S47, S57, S67, S77, S87, S97],
    C8 = [S18, S28, S38, S48, S58, S68, S78, S88, S98],
    C9 = [S19, S29, S39, S49, S59, S69, S79, S89, S99],

    S1 = [
        S11, S12, S13,
        S21, S22, S23,
        S31, S32, S33
    ],
    S2 = [
        S41, S51, S61,
        S42, S52, S62,
        S43, S53, S63
    ],
    S3 = [
        S71, S81, S91,
        S72, S82, S92,
        S73, S83, S93
    ],

    S4 = [
        S14, S24, S34,
        S15, S25, S35,
        S16, S26, S36
    ],
    S5 = [
        S44, S54, S64,
        S45, S55, S65,
        S46, S56, S66
    ],
    S6 = [
        S74, S84, S94,
        S75, S85, S95,
        S76, S86, S96
    ],

    S7 = [
        S17, S27, S37,
        S18, S28, S38,
        S19, S29, S39
    ],
    S8 = [
        S47, S57, S67,
        S48, S58, S68,
        S49, S59, S69
    ],
    S9 = [
        S77, S87, S97,
        S78, S88, S98,
        S79, S89, S99
    ],

    no_duplicates([
        C1, C2, C3, C4, C5, C6, C7, C8, C9,
        S1, S2, S3, S4, S5, S6, S7, S8, S9
    ]),

    Solution = [
        S11, S12, S13, S14, S15, S16, S17, S18, S19,
        S21, S22, S23, S24, S25, S26, S27, S28, S29,
        S31, S32, S33, S34, S35, S36, S37, S38, S39,
        S41, S42, S43, S44, S45, S46, S47, S48, S49,
        S51, S52, S53, S54, S55, S56, S57, S58, S59,
        S61, S62, S63, S64, S65, S66, S67, S68, S69,
        S71, S72, S73, S74, S75, S76, S77, S78, S79,
        S81, S82, S83, S84, S85, S86, S87, S88, S89,
        S91, S92, S93, S94, S95, S96, S97, S98, S99
    ],
    format("----------------------
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
| ~a ~a ~a ~a ~a ~a ~a ~a ~a |
----------------------", Solution).
% example problem - the _ is 7
% sudoku([
% _, 4, 6, 5, 8, 1, 9, 3, 2,
% 1, 3, 2, 6, 4, 9, 8, 7, 5,
% 9, 5, 8, 2, 3, 7, 6, 1, 4,
% 2, 6, 9, 3, 1, 8, 4, 5, 7,
% 4, 8, 3, 7, 5, 2, 1, 6, 9,
% 5, 7, 1, 4, 9, 6, 3, 2, 8,
% 6, 9, 4, 1, 2, 5, 7, 8, 3,
% 8, 1, 5, 9, 7, 3, 2, 4, 6,
% 3, 2, 7, 8, 6, 4, 5, 9, 1], S).


% If you’re a puzzle enthusiast, you can get lost in Prolog. If you want to dive deeper into the puzzles I’ve presented, Eight Queens is a good place to start.
% Solve the Eight Queens problem by taking a list of queens. Rather than a tuple, represent each queen with an integer, from 1–8. Get the row of a queen by its position in the list and the column by the value in the list.
