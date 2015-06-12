-module(sortarray).

-export([
    demo/0,
    subseq/1,
    remove/2,
    reverse/1,
    mirror/1,
    total/1
  ]).


% list manipulation

total(L) ->
    lists:sum(L).

reverse(L) ->
    lists:reverse(L).

mirror(List) ->
    List ++ lists:reverse(List).

remove(_, []) -> [];
remove(1, [_|T]) -> T;
remove(N, [H|T]) -> [H | remove(N-1, T)].

subseq(A) ->
    lists:sublist(A,length(A)-1).


demo() ->
    List1 = lists:seq(1,10),
    List2 = reverse(List1),
    List3 = remove(2,List2),
    List4 = lists:append([2], List3),
    io:fwrite("~s~n", [io:write(List4)]).





