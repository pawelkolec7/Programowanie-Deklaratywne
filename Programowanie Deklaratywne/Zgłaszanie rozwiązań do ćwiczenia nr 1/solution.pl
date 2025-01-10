%%% Jako pierwszą klauzulę (nie komentarz!) należy zdefiniować swoje dane     %%%
%%% w postaci faktu: student(imię, nazwisko, numer_indeksu, numer_grupy_lab). %%%
%%% Przykładowo:  student(jan,nowak_jeziorański,150000,2).                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
student(paweł,kolec,155873,8).   
kobieta(maria).
kobieta(ewa).
kobieta(agata).
kobieta(anna).
kobieta(joanna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

mężczyzna(piotr).
mężczyzna(adam).
mężczyzna(marek).
mężczyzna(robert).
mężczyzna(jan).
mężczyzna(krzysztof).
mężczyzna(radek).
mężczyzna(darek).
mężczyzna(tomek).
mężczyzna(jacek).


rodzic(piotr,marek).
rodzic(piotr,agata).
rodzic(piotr,jan).
rodzic(maria,marek).
rodzic(maria,agata).
rodzic(maria,jan).
rodzic(adam,anna).
rodzic(adam,joanna).
rodzic(adam,krzysztof).
rodzic(ewa,anna).
rodzic(ewa,joanna).
rodzic(ewa,krzysztof).
rodzic(robert,radek).
rodzic(robert,beata).
rodzic(agata,radek).
rodzic(agata,beata).
rodzic(jan,darek).
rodzic(jan,tomek).
rodzic(anna,darek).
rodzic(anna,tomek).
rodzic(krzysztof,jacek).
rodzic(krzysztof,iwona).
rodzic(agnieszka,jacek).
rodzic(agnieszka,iwona).
małżeństwo(maria,piotr).
małżeństwo(adam,ewa).
małżeństwo(robert,agata).
małżeństwo(jan,anna).
małżeństwo(krzysztof,agnieszka).


matka(X,Y) :- kobieta(X), rodzic(X,Y).
ojciec(X,Y) :- mężczyzna(X), rodzic(X,Y).
siostra(X,Y) :- kobieta(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
brat(X,Y) :- mężczyzna(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
babcia(X,Z) :- kobieta(X), rodzic(X,Y), rodzic(Y,Z).
dziadek(X,Z) :- mężczyzna(X), rodzic(X,Y), rodzic(Y,Z).
wuj(X,Y) :- mężczyzna(X), matka(Z,Y), brat(X,Z).
stryj(X,Y) :- mężczyzna(X), ojciec(Z,Y), brat(X,Z).
rodzeństwo(X,Y) :- siostra(X,Y); brat(X,Y).
kuzyn(Z,A) :- mężczyzna(Z), rodzic(Y,Z), rodzeństwo(Y,X), rodzic(X,A).
żona(X,Y) :- kobieta(X), małżeństwo(X,Y); kobieta(X), małżeństwo(Y,X).
mąż(X,Y) :- mężczyzna(X), małżeństwo(X,Y); mężczyzna(X), małżeństwo(Y,X).
teściowa(Z,X) :- kobieta(Z), matka(Z,Y), żona(Y,X).


szwagier(Z,X) :- siostra(Y,X), mąż(Z,Y).
szwagier(Z,X) :- żona(Y,X), brat(Z,Y).










