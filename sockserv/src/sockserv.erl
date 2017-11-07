-module(sockserv).

-behaviour(application).

-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_Type, _Args) ->
  io:fwrite("starting sockserv app~n"),
  sockserv_sup:start_link().

stop(_State) ->
  ok.
