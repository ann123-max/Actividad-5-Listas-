%HECHOS:

% Definición de género usando listas
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
