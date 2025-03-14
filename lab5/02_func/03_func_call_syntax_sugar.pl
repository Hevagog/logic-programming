/*

% TODO:
% 1. define <# operator

:- op(400,xfx, <#).

% 2. define # operator

:- op(500,yfx, #).

% 3. finish the following predicate
%    *DO NOT* copy func_call from other files.
%    When testing just load it from `02_func_call_default`, i.e., in swipl interpreter write ['02_func_call_default.pl'] before testing
Result <# Function # ArgsChain :- 
	parse_args_chain(ArgsChain, Args),
	CompoundTerm =.. [Function | Args],
    call(CompoundTerm, Result).

parse_args_chain(H # T, [H|TArgs]) :- 
    !, 
    parse_args_chain(T, TArgs).
	parse_args_chain(H, [H]).

parse_args_chain(H, X) :-
    % the end
    .
    */
:- op(400,xfx, <#).
:- op(500,xfy, #).

Result <# Function # ArgsChain :- 
    parse_args_chain(ArgsChain, Args), 
    func_call(Function, Args, Result).

parse_args_chain(H # T, [H|TArgs]) :- 
    !, 
    parse_args_chain(T, TArgs).

parse_args_chain(H, [H]).
