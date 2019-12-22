male(rickard).
male(eddard).
male(brandon).
male(benjen).
male(robb).
male(bran).
male(rickon).
male(jon).
male(aerys).
male(viserys).
male(aegon).
male(rhaegar).


female(lyarra).
female(catelyn).
female(lyanna).
female(sansa).
female(arya).
female(rhaella).
female(elia).
female(daenerys).
female(rhaenys).


child(eddard,rickard).
child(brandon, rickard).
child(benjen, rickard).
child(lyanna, rickard).

child(eddard,lyarra).
child(brandon, lyarra).
child(benjen, lyarra).
child(lyanna, lyarra).


child(rickon, eddard).
child(bran, eddard).
child(arya, eddard).
child(sansa, eddard).
child(robb, eddard).

child(rickon, catelyn).
child(bran, catelyn).
child(arya, catelyn).
child(sansa, catelyn).
child(robb, catelyn).

child(daenerys, aerys).
child(viserys, aerys).
child(rhaegar, aerys).

child(daenerys, rhaella).
child(viserys, rhaella).
child(rhaegar, rhaella).


child(rhaenys, rhaegar).
child(aegon, rhaegar).


child(rhaenys, elia).
child(aegon, elia).

child(jon, rhaegar).
child(jon,lyanna).



spouse(rickard,lyarra).
spouse(lyarra,rickard).
spouse(eddard,catelyn).
spouse(catelyn,eddard).
spouse(aerys,rhaella).
spouse(rhaella,aerys).
spouse(rhaegar,elia).
spouse(elia,rhaegar).
spouse(rhaegar,lyanna).
spouse(lyanna,rhaegar).


husband(X,Y) :-
    male(X),
    female(Y),
    spouse(X,Y).

wife(X,Y) :-
    female(X),
    male(Y),
    spouse(X,Y).

%considering half-brothers also
brothers(X,Y) :-
    not(X = Y),
    male(X),
    male(Y),
    father(Z,X),
    father(Z,Y).

%considering half-sisters also
sisters(X, Y):-
    not(X = Y),
    female(X),
    female(Y),
    father(Z,X),
    father(Z,Y).

siblings(X, Y):-
    male(X),
    female(Y),
    father(Z,X),
    father(Z,Y).

siblings(X, Y):-
    female(X),
    male(Y),
    father(Z,X),
    father(Z,Y).

mother(X,Y):-
    female(X),
    child(Y,X).

father(X,Y):-
    male(X),
    child(Y,X).

aunt(X,Y):-
    female(X),
    child(Y,Z),
    (siblings(X,Z);sisters(X,Z)).


uncle(X,Y):-
    male(X),
    child(Y,Z),
    (siblings(X,Z);brothers(X,Z)).


grandchild(X,Y):-
    child(X,Z),
    child(Z,Y).

grandson(X,Y):-
    male(X),
    grandchild(X,Y).

granddaughter(X,Y):-
    female(X),
    grandchild(X,Y).


descendant(X,Y):-
    child(X,Y);
    (   child(X,Z),
    descendant(Z,Y)).
