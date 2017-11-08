%%%-------------------------------------------------------------------
%% @doc new_project public API
%% @end
%%%-------------------------------------------------------------------

-module(new_project_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    {ok, Port} = application:get_env(http_port),
    {ok, Pid} = new_project_sup:start_link(),
    Routes = [ {
        '_',
        [
            {"/", new_project_root, []}
        ]
    } ],
    Dispatch = cowboy_router:compile(Routes),

    TransOpts = [ {ip, {0,0,0,0}}, {port, Port} ],
    ProtoOpts = #{env => #{dispatch => Dispatch}},

    {ok, _} = cowboy:start_clear(oh_my_cowboy, TransOpts, ProtoOpts),

    {ok, Pid}.


%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
