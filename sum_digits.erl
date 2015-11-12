-module(sum_digits).
-compile(export_all).
 
sum_digits(N) ->
    sum_digits(N,10).
 
sum_digits(N,B) ->
    sum_digits(N,B,0).
 
sum_digits(0,_,Acc) ->
    Acc;
sum_digits(N,B,Acc) when N < B ->
    Acc+N;
sum_digits(N,B,Acc) ->
    sum_digits(N div B, B, Acc + (N rem B)).

start(A) -> 
  M = round(math:pow(2,A)),
  sum_digits(M).

