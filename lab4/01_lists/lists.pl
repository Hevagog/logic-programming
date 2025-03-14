remove_element(_,[],[]).
remove_element(X,[X|L],L).
remove_element(X, [Z|L], [Z|NL]) :-
    X \= Z,
    remove_element(X,L,NL).

remove_all_occurrences(_,[],[]).
remove_all_occurrences(X,[X|L],NL) :-
    remove_all_occurrences(X,L,NL).
remove_all_occurrences(X, [Z|L], [Z|NL]) :-
    X \= Z,
    remove_all_occurrences(X,L,NL).

add_element(X, L, [X|L]).
add_element(X, [Z|L], [Z|NL]) :-
    add_element(X, L, NL).

list_reverse([], Acc, Acc).
% Every element is put at left beginning of the accumulator
% Effectively, the last element in the list will become first
list_reverse([H|T], Acc, Result) :-
    NewAcc = [H|Acc],
    list_reverse(T, NewAcc, Result).
list_reverse(List, Result) :-
    list_reverse(List, [], Result).

palindrome(L) :-
    list_reverse(L,X),
    X=L.

sublist(L, SL) :-
    append(_, SL, X),
    append(X, _, L).

cut_off_left(N, L, NL) :-
    length(X, N),
    append(X, NL, L).

cut_off_right(N, L, NL) :-
    length(X, N),
    append(NL, X, L).

contains_list(L, SL) :- fail.

permutation([], []).
permutation(L, [X|P]) :-
    remove(X, L, Rest),
    permutation(Rest, P).

remove(X, [X|Tail], Tail).
remove(X, [Y|Tail], [Y|Rest]) :-
    remove(X, Tail, Rest).

split([], [], []).
split([L], [L], []).
split([X, Y | L], [X | LL], [Y | PL]) :-
    split(L, LL, PL).

flat_list([], []).
flat_list([X|NL], L) :-
    flat_list(X, DD),
    flat_list(NL, D),
    append(DD, D, L).
flat_list(X, [X]).