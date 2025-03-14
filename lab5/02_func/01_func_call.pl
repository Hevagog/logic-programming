func_call(Function/NArgs/OutputIndex, InputArgs, Output) :-
    nth1(OutputIndex, Args, Output,InputArgs),
	Call =.. [Function | Args],
    call(Call).