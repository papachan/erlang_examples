-module(gabriel).

-export([start/0, contador/0, incremento/1]).

contador() ->
    incr ! {inc, self()},
    receive
	{val, N} ->
	    N
    end.


incremento(N) ->
    receive
        {inc, Who} ->
	    Who ! { val, N },
	    incremento(N + 1)
    end.

start() ->
    register(incr, spawn(gabriel,incremento,[1])).
