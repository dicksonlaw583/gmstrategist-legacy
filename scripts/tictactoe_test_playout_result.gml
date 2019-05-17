///tictactoe_test_playout_result()
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
expected = TicTacToeResult(1, true, 1, 4, 7);
got = tictactoe_playout_result(state);
assert_equal(got, expected, "X player win gives wrong playout result!");

// O player win
state = TicTacToeState(
  O, X, O,
  X, O, O,
  O, X, X,
  X
);
expected = TicTacToeResult(0, true, 2, 4, 6);
got = tictactoe_playout_result(state);
assert_equal(got, expected, "O player win gives wrong playout result!");

// Draw
state = TicTacToeState(
  O, X, X,
  X, O, O,
  X, O, X,
  O
);
expected = TicTacToeResult(0.5, true, undefined, undefined, undefined);
got = tictactoe_playout_result(state);
assert_equal(got, expected, "Draw gives wrong playout result!");

// Non-final state
state = TicTacToeState(
  X, _, _,
  O, _, _,
  _, _, _,
  X
);
expected = TicTacToeResult(0.5, false, undefined, undefined, undefined);
got = tictactoe_playout_result(state);
assert_equal(got, expected, "Non-final state gives wrong playout result!");
