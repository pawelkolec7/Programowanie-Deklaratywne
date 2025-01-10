%%% Jako pierwszą klauzulę (nie komentarz!) należy zdefiniować swoje dane     %%%
%%% w postaci faktu: student(imię, nazwisko, numer_indeksu, numer_grupy_lab). %%%
%%% Przykładowo:  student(jan,nowak_jeziorański,150000,2).                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
student(paweł,kolec,155873,8).

klonuj([],[]).
klonuj([A|B], [[A,A]|C] ) :- klonuj(B,C).

srodek([A],A).
srodek(X,Y):-append([A|B],[C],X),srodek(B,Y).

polowki([],[],[]).
polowki([H|T],[H|TT],D):-append(A,[B],T),polowki(A,TT,C),append(C,[B],D).

sumuj([],0).
sumuj([A|B],C) :- sumuj(B,D), C is D+A.

ile_wiekszych([], _, 0).
ile_wiekszych([A|B], X, Y) :- A > X, ile_wiekszych(B, X, Z), Y is Z + 1.
ile_wiekszych([A|B], X, Y) :- A =< X, ile_wiekszych(B, X, Y).

plus_minus([],0).
plus_minus([A|B],C) :- plus_minus(B,D), A = +, C is D+1.
plus_minus([A|B],C) :- plus_minus(B,D), A = -, C is D-1.

wstawiaj([], A, 1, [A]).
wstawiaj([B|C], A, 1, [A,B|C]).
wstawiaj([B|C], A, E, [B|D]) :- E > 1, F is E - 1, wstawiaj(C, A, F, D).

usuwaj([A],1,[]).
usuwaj([A|B],1,B).
usuwaj([A|B],C,E):-usuwaj(B,D,E), C is D+1.

rozdziel([],_,[],[]).
rozdziel([A|B],X,[A|C],D) :- A < X, rozdziel(B,X,C,D).
rozdziel([A|B],X,C,[A|D]) :- A >= X, rozdziel(B,X,C,D).

powiel([],[],[]).
powiel([A|B],[D|C],[A|F]) :- D > 1, E is D-1, powiel([A|B],[E|C],F).
powiel([A|B],[D|C],[A|F]) :- powiel(B,C,F). 