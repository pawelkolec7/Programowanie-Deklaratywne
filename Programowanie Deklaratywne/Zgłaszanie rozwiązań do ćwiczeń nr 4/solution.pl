%%% Jako pierwszą klauzulę (nie komentarz!) należy zdefiniować swoje dane     %%%
%%% w postaci faktu: student(imię, nazwisko, numer_indeksu, numer_grupy_lab). %%%
%%% Przykładowo:  student(jan,nowak_jeziorański,150000,2).                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
student(paweł,kolec,155873,8).

ostatni(X,[X]).
ostatni(X,[_|Y]) :- ostatni(X,Y).

przedostatni(X,[X,_]).
przedostatni(X,[_|Y]) :- przedostatni(X,Y).

bezostatniego([_],[]).
bezostatniego([Z|X],[Z|Y]) :- bezostatniego(X,Y).

nakoniec(X,[],[X]).
nakoniec(E,[X|Y],[X|Z]) :- nakoniec(E,Y,Z).

zakazdym([],E,[]).
zakazdym([X|Y],E,[X,E|Z]) :- zakazdym(Y,E,Z).

codrugi([],[]).
codrugi([_],[]).
codrugi([X1,X2|Y],[X2|D]) :- codrugi(Y,D).

wstaw_za([X|X1], X, Y, [X,Y|X1]).
wstaw_za([X|X1], A, Y, [X|Y1]) :- X \= A, wstaw_za(X1, A, Y, Y1).

lewoprawo(X,[X|LP],[],LP).
lewoprawo(X,[H|L],[H|LL],LP) :- lewoprawo(X,L,LL,LP).

wymiana(_,_,[],[]).
wymiana(X,Y,[X|L1],[Y|L2]) :- wymiana(X,Y,L1,L2).
wymiana(X,Y,[H|L1],[H|L2]) :- wymiana(X,Y,L1,L2).

polacz([],[]).
polacz([H|T],L) :- polacz(T,L1), append(H,L1,L).