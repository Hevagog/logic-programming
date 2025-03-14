func_call(Function/NArgs/OutputIndex, InputArgs, Output) :-
  !,
  nth1(OutputIndex, Args, Output,InputArgs),
  length(Args, NArgs),
  Call =.. [Function | Args],
  call(Call).
  
  func_call(Function/NArgs, InputArgs, Output) :-
  nth1(NArgs, Args, Output, InputArgs),
  length(Args, NArgs),
  Call =..  [Function | Args],
  %writeln(Call),
  call(Call).

