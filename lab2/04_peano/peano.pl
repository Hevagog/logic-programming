peano_number(zero, 0).
peano_number(s(X), N) :-
    peano_number(X, N1),
    N is N1 + 1.

peano_add(X, zero, X).
peano_add(X, s(Y), s(Z)) :-
    peano_add(X, Y, Z).

peano_times(X, zero, zero).
peano_times(X, s(Y), Z) :-
    peano_times(X, Y, Z1),
    peano_add(Z1, X, Z).

peano_greater_than(s(X), Y).
peano_greater_than(s(X), s(Y)) :- 
    peano_greater_than(X, Y).

peano_div(X, Y, Z) :- fail.

peano_mod(X, Y, Z) :- fail.

peano_is_even(X) :- fail.

peano_is_odd(X) :- fail.
