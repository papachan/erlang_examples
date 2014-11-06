-module(otp_server).

%% API

-export([start/0, stop/0, say_hello/0, get_count/0]).

%% Callbacks

-export([init/0]).

-define(SERVER, ?MODULE).

-record(state, {count}).

%% API Functions

start() ->
    spawn(?MODULE, init, []).

stop() ->
    ?SERVER ! stop,
    ok.

say_hello() ->
    ?SERVER ! say_hello,
    ok.

get_count() ->
    ?SERVER ! {self(), get_count},
    receive
        {count, Value} ->
	    Value
    end.

%% Callback functions

init() ->
    register(?SERVER, self()),
    loop(#state{count=0}).

%% Internal functions
loop(#state{count = Count}) ->
    receive Msg ->
	    case Msg of stop ->
		    exit(normal);
		say_hello ->
		    io:format("Hello~n");
		{From, get_count} ->
                    From ! {count, Count}
            end
    end,
    loop(#state{count = Count +1}).
