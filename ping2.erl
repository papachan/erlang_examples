-module('ping2').
-export([play/1]).
 
play(N) when is_integer(N), N > 0 ->
    Pong = spawn(fun pong/0),
    ping(N, Pong).
 
ping(0,Pong) ->
    Pong ! exit,
    ok;
ping(N, Pong) ->
    Pong ! {self(), ping},
    receive
	pong ->
	    io:format("~w : pong [~w]~n", [self(), N])
    end,
    ping(N - 1, Pong).
 
pong() ->
    receive
	{From, ping} ->
	    io:format("~w : ping~n", [self()]),
	    From ! pong,
	    pong();
	exit ->
	    ok
    end.
