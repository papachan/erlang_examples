% networked ping
% -- 
% Open firewall ports 4369 (erlang port mapper) and 9100-9105 (communication ports)
%
% On node 1 start your shell with this command:
%   erl -name node@hostname1.com -setcookie cook -kernel inet_dist_listen_min 9100 inet_dist_listen_max 9105
%
% On node 2 start your shell with this command:
%   erl -name node@hostname2.com -setcookie cook -kernel inet_dist_listen_min 9100 inet_dist_listen_max 9105
%
% scp pingpong.erl to both nodes
%
% Then on node 1, do
%   c(pingpong).
%   pingpong:start_pong().
%
% Then on node 2, do
%   c(pingpong).
%   pingpong:start_ping(node@hostname1.com).
%

% Other useful commands
%   net_adm:world().
%   net_adm:nodes().
%   net_adm:ping(some@node).

-module(pingpong2).
-export([ start_ping/1, start_pong/0, ping/1, pong/0 ]).

start_ping(Receiver) -> spawn(pingpong, ping, [ Receiver ]).

ping(Receiver) ->
  { pong, Receiver } ! { ping, self() },
  receive
    pong -> io:format("Got pong!~n")
  end.


start_pong() ->
  register(pong, spawn(pingpong, pong, [])).

pong() ->
  receive

    finished ->
      io:format("Pong finished~n");

    { ping, Sender } ->
      io:format("Got ping!~n"),
      Sender ! pong,
      pong()
  end.

