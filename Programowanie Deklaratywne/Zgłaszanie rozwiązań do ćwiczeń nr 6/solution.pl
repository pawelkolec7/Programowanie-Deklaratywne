%%% Jako pierwszą klauzulę (nie komentarz!) należy zdefiniować swoje dane     %%%
%%% w postaci faktu: student(imię, nazwisko, numer_indeksu, numer_grupy_lab). %%%
%%% Przykładowo:  student(jan,nowak_jeziorański,150000,2).                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
student(paweł,kolec,155873,8).

najwiekszy([X],X).
najwiekszy([H|T],Mxi) :- najwiekszy(T,Mxi2), H =< Mxi2, Mxi=Mxi2.
najwiekszy([H|T],Mxi) :- najwiekszy(T,Mxi2), H > Mxi2, Mxi=H.

liniowa([_,_]).
liniowa([A,B,C|T]) :- A-B =:= B-C, liniowa([B,C|T]).

oddziel([H|T],1,[H],T).
oddziel([H|T],A,[H|C],R) :- B is A-1, oddziel(T,B,C,R).
rozbij([],[],[]).
rozbij(L1,[B|T2],[C|L]) :- oddziel(L1,B,C,R), rozbij(R,T2,L).

przynaleznosc([],_,[],[]).
przynaleznosc([H|T],[L,P],[H|LW],LZ) :- H >= L, H =< P, przynaleznosc(T,[L,P],LW,LZ).
przynaleznosc([H|T],[L,P],LW,[H|LZ]) :- H < L, przynaleznosc(T,[L,P],LW,LZ).
przynaleznosc([H|T],[L,P],LW,[H|LZ]) :- H > P, przynaleznosc(T,[L,P],LW,LZ).

decnabin(0,[0]).
decnabin(1,[1]) :- !.
decnabin(N,B) :- N > 0, NMod2 is mod(N,2), NDiv2 is div(N,2), decnabin(NDiv2,B1), append(B1,[NMod2],B).

rozdziel([],_,[],[]).
rozdziel([H|T],X,[H|L1],L2) :- H < X, rozdziel(T,X,L1,L2).
rozdziel([H|T],X,L1,[H|L2]) :- H >= X, rozdziel(T,X,L1,L2).
szybkisort([],[]).
szybkisort([H|T],S) :- rozdziel(T,H,M,W), szybkisort(M,MS), szybkisort(W,WS), append(MS,[H|WS],S).

doposort([],X,[X]).
doposort([H|T],X,[X,H|T]) :- H > X.
doposort([H|T],X,[H|L]) :- doposort(T,X,L).
wstawsort([],[]).
wstawsort([H|T],S) :- wstawsort(T,S1), doposort(S1,H,S).

unikalne([],[]).
unikalne([H|T],[H|L]) :- not(member(H,T)), unikalne(T,L).
unikalne([H|T],L) :- member(H,T), unikalne(T,L).

ciagliczb(M,M,[M]).
ciagliczb(M,N,[M|L]) :- M < N, M1 is M+1, ciagliczb(M1,N,L).

najblizszy(_, [X], X).
najblizszy(X, [H|T], H) :- najblizszy(X, T, X1), abs(H-X) < abs(X1-X).
najblizszy(X, [H|T], X1) :- najblizszy(X, T, X1), abs(H-X) >= abs(X1-X).

odsiewaj(_,[],[]).
odsiewaj(X,[H|T],L) :- mod(H,X) =:= 0, odsiewaj(X,T,L).
odsiewaj(X,[H|T],[H|L]) :- odsiewaj(X,T,L).

sito([],[]).
sito([H|T],[H|L]) :- odsiewaj(H,T,L1), sito(L1,L).
eratostenes(N,L) :- ciagliczb(2,N,CL), sito(CL,L).