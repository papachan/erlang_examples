-module(exercises2).

% parse a simple list of characters and increment each chars

-export([start/0, parse/1]).


parse(L) -> mylist_acc(L).


% parse recursively our list
mylist_acc([]) -> 
    ok;
mylist_acc([H|T]) -> 
    P = hd(H),
    io:format("~s", [[P+1]]), 
    mylist_acc(T).


start() ->
    parse(["H","A","L"]).
