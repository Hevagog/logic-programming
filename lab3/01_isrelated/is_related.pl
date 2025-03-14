% this query should find all the related people without duplicates
% the RelatedPairs should contain pairs <name1> - <name2>, e.g.
% [ anna - mateusz, adolf - jozef ]
%
% tip 1. use a correct aggregation function to get an initial list 
%        you can assume, the `is_related` is already defined as in the instructions
% tip 2. then clean up the list and remove duplicate s
%       - mateusz - anna and mateusz - anna are obvious duplicates 
%       - mateusz - anna and anna - mateusz are also considered to be duplicates
% tip 3. `sort` removes obvious duplicates (mateusz-anna and mateusz-anna)
% tip 4. `@<` operator compares two terms, e.g, `anna @< mateusz` is true.
all_relatives(Relatives) :- 
    setof(X-Y, (is_related(X, Y), X @< Y), Relatives),
    sort(Relatives, Result).

:- dynamic is_related/2.