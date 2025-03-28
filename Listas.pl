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
