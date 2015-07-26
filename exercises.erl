-module(exercises).

-export([sum/1]).

% Write a function sum/1 which, given a positive integer N, 
% will return the sum of all the integers between 1 and N.

sum(Boundary) ->
    sum_acc(1,Boundary,0).

sum_acc(Index, Boundary, Sum) when Index =< Boundary ->
    sum_acc(Index + 1, Boundary, Sum + Index);
sum_acc(_I, _B, Sum)->
    Sum.



