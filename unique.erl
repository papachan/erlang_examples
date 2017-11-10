-module (unique).
-export ([unique/1]).

unique([H|L]) ->
  unique([X || X <- L, X < H]) ++ [H] ++ unique([X || X <- L, X > H]);
  unique([]) -> [].
