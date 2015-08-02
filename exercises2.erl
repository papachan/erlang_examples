-module(exercises2).

% parse a simple list of characters and increment

-export([start/0, parse/1]).


parse(L) -> mylist_acc(L).



mylist_acc(L) ->
    L.


start() ->
    parse(["H","A","L"]).
