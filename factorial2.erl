-module(test).
-compile(export_all).

%% factorial implemented as you would normally do in most
%% imperative languages.
fac_if(N) ->
  if 
    N =:= 0 ->
      1;
    true ->
      N * fac_if(N - 1)
  end.
%% factorial implemented with a case. if N matches 0 it
%% returns 0. If N matches any other value it will call
%% fac_case with N-1
fac_case(N) ->
  case N of
    0 ->
      1;
    N ->
      N * fac_case(N - 1)
  end.
%% factorial implemented with function clauses
 fac(0) ->
  1;
fac(N) ->
  N * fac(N - 1).
