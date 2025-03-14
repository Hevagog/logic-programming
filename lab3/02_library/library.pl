query_1(Authors) :-
    setof(Author, BookID^Edition^book(BookID, _, author(Author, _), Edition), Authors).

query_2(Titles) :- fail.

query_3(AuthorsTitles) :- fail.

query_4(AuthorsPairs) :- fail.

query_5(LongLived) :- fail.

