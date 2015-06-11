-module(hello).
-export([
    hello/1,
    print_path/0
    ]).

hello(0) -> [];
hello(N) ->
	io:fwrite("hello, world\n"),
    hello(N-1).

print_path() ->
	io:format("Current path:~p~n",[c:pwd()]).
