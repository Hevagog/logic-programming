ifelse(X, Y, _) :- 
    call(X),
    !,
    call(Y).
ifelse(_, _, Z) :- 
    call(Z).