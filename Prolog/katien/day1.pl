% Find:
% Some free Prolog tutorials - http://www.cs.utexas.edu/~cannata/cs345/Class%20Notes/12%20prolog_intro.pdf
% A support forum (there are several) - https://www.reddit.com/r/prolog/, http://stackoverflow.com/questions/tagged/gnu-prolog
% One online reference for the Prolog version you’re using - http://www.gprolog.org/manual/gprolog.html#sec9

% Do:
% Make a simple knowledge base. Represent some of your favorite books and authors.
by(fight_club, chuck_palahniuk).
by(the_girl_with_the_dragon_tattoo, stieg_larsson).
by(the_girl_who_played_with_fire, stieg_larsson).
by(you_dont_know_js, kyle_simpson).

% Find all books in your knowledge base written by one author.
% | ?- by(Book, stieg_larsson).

% Make a knowledge base representing musicians and instruments. Also represent musicians and their genre of music.
musician_instrument(nikki_sixx, bass).
musician_instrument(skrillex, computer).
musician_instrument(eddie_van_halen, guitar).
musician_instrument(mick_mars, guitar).
musician_instrument(illenium, computer).

musician_genre(nikki_sixx, rock).
musician_genre(skrillex, edm).
musician_genre(eddie_van_halen, rock).
musician_genre(mick_mars, rock).
musician_genre(illenium, edm).

% Find all musicians who play the guitar.
% musician_instrument(Musician, guitar).
