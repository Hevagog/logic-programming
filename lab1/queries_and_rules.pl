/**
 * is_cousin(+X:term, +Y:term) is semidet
 * is_cousin(+X:term, -Y:term) is nondet
 * is_cousin(-X:term, +Y:term) is nondet
 * is_cousin(-X:term, -Y:term) is nondet
 * 
 * "is_cousin" is true for such X and Y,
 * that X and Y are different and share an ancestor
 *
 * @arg X - name of a cousing
 * @arg Y - name of the second cousin
 * 
 * @tbd Replace `fail` with something reasonable.
 *      You may have to add a second rule of the same name.
 *      You may assume that 'is_ancestor/2' is already define (check the bottom of the file).
 */

are_siblings(X, Y) :- is_parent_of_child(Z, X),
    is_parent_of_child(Z, Y), 
    X \= Y.

is_cousin(X, Y) :- is_ancestor(Z, X),
    is_ancestor(Z, Y),
    X \= Y.

/**
 * is_descendant(+X:term, +Y:term) is semidet
 * is_descendant(+X:term, -Y:term) is nondet
 * is_descendant(-X:term, +Y:term) is nondet
 * is_descendant(-X:term, -Y:term) is nondet
 * 
 * "is_descendant" is true for such X and Y,
 * that X is a descendant of Y.
 *
 * @arg X - name of a descendant
 * @arg Y - name of an ancestor
 * 
 * @tbd Replace `fail` with something reasonable.
 *      You may have to add a second rule of the same name.
 *      You may assume that 'is_ancestor/2' is already define (check the bottom of the file).
 */
 
is_descendant(X, Y) :- is_parent_of_child(Y, X).

is_descendant(X, Y) :- is_parent_of_child(Y, Z),
                     is_descendant(X, Z).

/**
 * is_brother_in_law(+X:term, +Y:term) is semidet
 * is_brother_in_law(+X:term, -Y:term) is nondet
 * is_brother_in_law(-X:term, +Y:term) is nondet
 * is_brother_in_law(-X:term, -Y:term) is nondet
 * 
 * "is_brother_in_law" is true for such X and Y,
 * that X is a brother-in-law of Y. 
 * Being brother-in-law means to be a wife's brother or (symmetrically) a sister's husband.
 wife's brother = sister's husband
 *
 * @arg X - name of a borther-in-law
 * @arg Y - name of the second brother-in-law
 * 
 * @tbd Replace `fail` with something reasonable.
 *      You may have to add some extra rules.
 *      You may assume that the following predicates are already defined is_brother/2, is_sister/2, are_husband_and_wife/2.
 *      Bonus: all points will be assigned to a solution using only two additional predicates (e.g., is_brother/2 and are_husband_and_wife/2).
 */

is_brother_in_law(X, Y) :- are_husband_and_wife(Y,Z),
    is_brother(X,Z).

is_brother_in_law(X, Y) :- are_husband_and_wife(X, Z),
    is_brother(Y,Z).
    
/**
 * is_ancestor(+X:term, +Y:term) is semidet
 * is_ancestor(+X:term, -Y:term) is nondet
 * is_ancestor(-X:term, +Y:term) is nondet
 * is_ancestor(-X:term, -Y:term) is nondet
 * 
 * "is_ancestor" is true for such X and Y,
 * where X is an ancestor of Y.
 *
 * @arg X - name of an ancestor
 * @arg Y - name of a descendant
 * 
 */
is_ancestor(X, Y) :- is_parent_of_child(X, Y).
is_ancestor(X, Y) :- is_parent_of_child(X, Z), 
    is_ancestor(Z, Y).

/**
 * Predicates, you can use in the definitions:
 * 
 * is_parent_of_child(X,Y) - X is parent of Y
 * is_brother(X,Y) - X is brother of Y
 * is_sister(X,Y) - X is sister of Y
 * are_husband_and_wife(X,Y) - X is husband of Y
 */
:- dynamic is_parent_of_child/2.
:- dynamic is_brother/2.
:- dynamic is_sister/2.
:- dynamic are_husband_and_wife/2.
