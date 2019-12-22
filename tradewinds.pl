route(karhold,braavos).
route(karhold,gulltown).
route(gulltown,tyrosh).
route(braavos,gulltown).
route(braavos,tyrosh).
route(tyrosh,volantis).
route(tyrosh,dorne).
route(volantis,dorne).


reachable(X,Y):-
    route(X,Y);
    (route(X,Z),
    reachable(Z,Y)).


reachable(X,Y,[X,Y]):-
    route(X,Y).


reachable(X,Y,L):-
    route(X,S),
    L = [X|T],
    reachable(S,Y,T).
