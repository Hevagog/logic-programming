is_cousin(X,Y) :- retractall(cousins_met),
				  cousins_met(X,Y).

is_cousin(X,Y) :- is_ancestor(Z,X),
                  is_ancestor(Z,Y),
    			  X \= Y,
    			  \+cousins_met(X,Y),
    			  \+cousins_met(Y,X),
    			  assert(cousins_met(X,Y)).

:- dynamic cousins_met/2.
