-module(sockserv_worker).
-behavior(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {}).

start_link() ->
  io:fwrite("start link!\n"),
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%%====================================================================
%% gen_server callbacks
%%====================================================================
init([]) ->
  process_flag(trap_exit, true),
  {ok, #state{}}.

%% Synchronous, possible return values
handle_call(Message, From, State) ->
  io:format("Generic call handler: '~p' from '~p' while in '~p'~n",[Message, From, State]),
  {reply, ok, State}.

%% Asynchronous, possible return values
handle_cast(shutdown, State) ->
  io:format("Generic cast handler: *shutdown* while in '~p'~n",[State]),
  {stop, normal, State};

%% generic async handler
handle_cast(Message, State) ->
  io:format("Generic cast handler: '~p' while in '~p'~n",[Message, State]),
  {noreply, State}.

%% Informative calls
handle_info(_Message, _Server) ->
  io:format("Generic info handler: '~p' '~p'~n",[_Message, _Server]),
  {noreply, _Server}.

%% Server termination
terminate(_Reason, _Server) ->
  io:format("Generic termination handler: '~p' '~p'~n",[_Reason, _Server]).

%% Code change
code_change(_OldVersion, _Server,_Extra) ->
  {ok,_Server}.
