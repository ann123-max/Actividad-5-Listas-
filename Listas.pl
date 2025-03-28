%HECHOS:

% Definición de género 
hombres([abraham, homero, herbert, bart, clancy]).
mujeres([mona, marge, patty, selma, lisa, maggie, jacqueline, ling]).

%Padres:

padre_de(abraham, [homero, herbert]).
padre_de(clancy, [marge, patty, selma]).
padre_de(homero, [bart, lisa, maggie]).

%Madres:

madre_de(mona, [homero]).
madre_de(marge, [bart, lisa, maggie]).
madre_de(jacqueline, [marge, patty, selma]).

madre_de(selma, [ling]).

%REGLAS

% Reglas para determinar género
es_hombre(Persona) :- hombres(Hombres), member(Persona, Hombres).
es_mujer(Persona) :- mujeres(Mujeres), member(Persona, Mujeres).

% Regla para verificar si alguien es hijo de una persona
es_hijo_de(Hijo, Padre) :- padre_de(Padre, Hijos), member(Hijo, Hijos).
es_hijo_de(Hijo, Madre) :- madre_de(Madre, Hijos), member(Hijo, Hijos).

%Reglas para verificar si una persona es primo de otra
primo_de(Primo1,Primo2) :- es_hombre(Primo1), es_hijo_de(Primo1,X),es_hijo_de(Primo2,Y),
    es_hijo_de(Y,Z),es_hijo_de(X,Z),Y\=Z.
prima_de(Primo1,Primo2) :- es_mujer(Primo1), es_hijo_de(Primo1,X),es_hijo_de(Primo2,Y),
    es_hijo_de(Y,Z),es_hijo_de(X,Z),Y\=Z.
    
%Regla para verificar los abuelos 
abuelo_de(X,Y) :- padre_de(X,C), member(L, C), ((padre_de(L,Z), member(Y,Z));(madre_de(L,T), member(Y,T))), !.
abuela_de(X,Y) :- madre_de(X,C), member(L, C), ((madre_de(L,Z), member(Y,Z));(padre_de(L, T), member(Y,T))), !.

%Regla para verificar los hermanos 
hermano_de(X,Y) :- es_hombre(X), padre_de(_,L), member(X,L), member(Y, L), X \= Y, !.
hermana_de(X,Y) :- es_mujer(X), padre_de(_,L), member(X,L), member(Y,L), X \= Y, !.

