-module(sockserv_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
  RestartStrategy = {one_for_one, 5, 10},
  Worker = {sockserv_worker,
           {sockserv_worker, start_link, []},
           temporary,
           brutal_kill,
           worker,
           [sockserv_worker]},
  Children = [Worker],
  {ok, { RestartStrategy, Children} }.
