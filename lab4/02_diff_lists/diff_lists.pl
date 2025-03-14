length_diff(L, N) :- 
    length_diff_helper(L, 0, N).
length_diff_helper(L-E, Acc, N) :- 
    L == E,
    N = Acc.
length_diff_helper([_|T]-E, 0, N) :- 
    length_diff_helper(T-E, 1, N).
length_diff_helper([_|T]-E, Y, N) :- 
    Y1 is Y+1,
    length_diff_helper(T-E,  Y1, N).

member_diff(M, L) :- fail.