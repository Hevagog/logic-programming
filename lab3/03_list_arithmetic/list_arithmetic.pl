list_number([], 0).
list_number([_|X], Y) :- 
    list_number(X, Y1),
    Y is Y1 + 1.

list_add([], X, X).
list_add([H|L1], L2, [H|L3]) :- 
    list_add(L1, L2, L3).

mapcia(_,1).
add(X1, X2, Y) :- Y is X1 + X2.

list_number_mfr([], 0).
list_number_mfr(X, Length) :- 
    maplist(mapcia,X,Z),
    foldl(add,Z,0,Length).
    
my_append(X, L2,[X|L2]).

list_add_mfr([], X, X).
list_add_mfr(L1, L2, L3) :-
    foldl(my_append,L1,[],L4),
    foldl(my_append, L4, L2, L3).

