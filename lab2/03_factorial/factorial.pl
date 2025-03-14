% @tbd: implement an old school factorial
% in recursive style

factorial(0,1).
factorial(Number, Result) :- Number > 0, 
    Number2 is Number - 1, 
    factorial(Number2, Result1), 
    Result is Number * Result1.

% primitive unit tests
% the 'test,' query should test the factorial
test :-
    foreach(test_case(I,E), test_result(I,E)).

test_case(-1, fail).
test_case(0, 1).
test_case(1, 1).
test_case(11, 39916800).

test_result(Input, ExpectedResult) :-
    ExpectedResult \= fail,
    \+ factorial(Input, _),
    format('ERROR: factorial(~w) -> expected ~w, got failure.\n', [Input, ExpectedResult]).
test_result(Input, ExpectedResult) :-
    ExpectedResult \= fail,
    factorial(Input, Result),
    \+ number(Result),
    format('ERROR: factorial(~w) -> expected ~w, did not get any number.\n', [Input, ExpectedResult]).
test_result(Input, ExpectedResult) :-
    ExpectedResult \= fail,
    factorial(Input, Result),
    Result \= ExpectedResult,
    format('ERROR: factorial(~w) -> expected ~w, got ~w.\n', [Input, ExpectedResult, Result]).
test_result(Input, ExpectedResult) :-   
    ExpectedResult \= fail,
    factorial(Input, ExpectedResult).
test_result(Input, fail) :-
    factorial(Input, Result),
    format('ERROR: factorial(~w) -> expected failure, got ~w.\n', [Input, Result]).
test_result(Input, fail) :-
    \+ factorial(Input, _).

