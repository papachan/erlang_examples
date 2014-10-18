-module(user_default).

-compile(export_all).

hello() ->
    io:fwrite("Hello Joe how are you?~n").

away(Time) ->
    io:format("Joe is away and will be back in ~w minutes~n",
    	[Time]).
