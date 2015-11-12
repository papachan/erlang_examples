-module(exercises).

-export([
       create/1, 
       reverse/1
]).

% Write a function that returns a list of the format [1,2,..,N-1,N] .

create(N) ->
    lists_acc(1, N, []).

lists_acc(Index, Boundary, L) when Index =< Boundary ->
    lists_acc(Index + 1, Boundary, L ++ [Index]);
lists_acc(_I, _B, L)->
    L.


% Write another function that returns a list of the format [N , N-1,..,2,1]

reverse(L) ->
    reverse_acc(L, []).

reverse_acc([], Acc) -> Acc;
reverse_acc([H | T], Acc) -> reverse_acc(T, [H | Acc]).
