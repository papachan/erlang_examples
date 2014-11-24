-module(functions).

-compile(export_all).

-export([head/1,second/1]).

% get the first element
head([H|_]) ->
    H.

% get the second element of a list
second([_,X|_]) ->
    X.
