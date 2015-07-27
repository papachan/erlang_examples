-module(counter2).

-export([start/0, counter/0, increment/1]).

% a counter example method with a spawned process and a mailbox

counter() ->
    incr ! {inc, self()},
    receive
	{val, N} ->
	    N
    end.


increment(N) ->
    receive
        {inc, Who} ->
	    Who ! { val, N },
	    increment(N + 1)
    end.

start() ->
    register(incr, spawn(counter2,increment,[1])).


