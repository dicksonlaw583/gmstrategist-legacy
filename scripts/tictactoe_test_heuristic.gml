///tictactoe_test_heuristic()
var _ = -1,
    O = 0,
    X = 1;
var got, expected, state;

// X player win
state = TicTacToeState(
  O, X, _,
  X, X, O,
  O, X, _,
  O
);
expected = 1;
got = tictactoe_heuristic(state, undefined);
assert_equal(got, expected, "X player win gives wrong heuristic result!");

// O player win
state = TicTacToeState(
  O, X, O,
  X, O, O,
  O, X, X,
  X
);
expected = 0;
got = tictactoe_heuristic(state);
assert_equal(got, expected, "O player win gives wrong heuristic result!");

// Draw
state = TicTacToeState(
  O, X, X,
  X, O, O,
  X, O, X,
  O
);
expected = 0.5;
got = tictactoe_heuristic(state);
assert_equalish(got, expected, "Draw gives wrong heuristic result!");

// Non-final state
state = TicTacToeState(
  X, _, _,
  O, _, _,
  _, _, _,
  X
);
expected = 0.5;
got = tictactoe_heuristic(state);
assert_equalish(got, expected, "Non-final state gives wrong heuristic result!");
