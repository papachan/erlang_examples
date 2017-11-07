%% List comprehension in Erlang
-module(lc).

-export([take/2]).
-export([partition/2]).
-export([pair/1]).

take([H|T], N) when N > 0 ->
  [H|take(T, N-1)];
take(_, 0) -> [].

partition(Pred, List) ->
  {[I || I <- List, Pred(I)],
   [I || I <- List, not(Pred(I))]}.

pair(L) ->
  L2 = lists:zip(lists:seq(1, length(L)), L),
  [[A, B] || {Ai, A} <- L2, {Bi, B} <- L2,
             Ai rem 2 == 1, Bi rem 2 == 0, Ai + 1 == Bi].

%% > lc_test:take(lists:seq(0,20), 7).
%% [0,1,2,3,4,5,6]

%% > lc_test:partition(fun(I) -> is_atom(I) end, [1, a, 2, b, 3.0]).
%% {[a,b],[1,2,3.0]}

%% > lc_test:pair(lists:seq(1,6)).
%% [[1,2],[3,4],[5,6]]
