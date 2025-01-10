%%% Jako pierwszą klauzulę (nie komentarz!) należy zdefiniować swoje dane     %%%
%%% w postaci faktu: student(imię, nazwisko, numer_indeksu, numer_grupy_lab). %%%
%%% Przykładowo:  student(jan,nowak_jeziorański,150000,2).                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
student(paweł,kolec,155873,8).
pionowy(odcinek(punkt(X,Y1), punkt(X,Y2))).
poziomy(odcinek(punkt(X1,Y), punkt(X2,Y))).
regularny(prostokąt(punkt(X1,Y1),punkt(X2,Y1),punkt(X2,Y2),punkt(X1,Y2))).

safe(state(X,Y,X,Y)).
safe(state(X,X,Y,X)).
safe(state(Y,Y,Y,X)).
safe(state(Y,X,Y,Y)).

move(state(east,W,G,C),farmer_west_alone,state(west,W,G,C)) :- safe(state(west,W,G,C)).
move(state(east,east,G,C),farmer_west_wolf,state(west,west,G,C)) :- safe(state(west,west,G,C)).
move(state(east,W,east,C),farmer_west_goat,state(west,W,west,C)) :- safe(state(west,W,west,C)).
move(state(east,W,G,east),farmer_west_cabbage,state(west,W,G,west)) :- safe(state(west,W,G,west)).
move(state(west,W,G,west),farmer_east_cabbage,state(east,W,G,east)) :- safe(state(east,W,G,east)).
move(state(west,west,G,C),farmer_east_wolf,state(east,east,G,C)) :- safe(state(east,east,G,C)).
move(state(west,W,west,C),farmer_east_goat,state(east,W,east,C)) :- safe(state(east,W,east,C)).
move(state(west,W,G,C),farmer_east_alone,state(east,W,G,C)) :- safe(state(east,W,G,C)).

can_get(state(east,east,east,east)).
can_get(StateBefore) :- move(StateBefore,Move,StateAfter), can_get(StateAfter).