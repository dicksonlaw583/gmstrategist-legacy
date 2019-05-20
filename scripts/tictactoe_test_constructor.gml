///tictactoe_test_constructor()

var _ = -1,
    O = 0,
    X = 1;
var got, expected;

// Basic X test
expected = GmstArray(1, 0, 1, 0, 1, 0, 1, 0, -1, 1);
got = TicTacToeState(
  X, O, X,
  O, X, O,
  X, O, _,
  X
);
assert_equal(got, expected, "Tic Tac Toe constructor with X failed!");

// Basic O test
expected = GmstArray(0, 1, 0, 1, 0, 1, 0, 1, -1, 0);
got = TicTacToeState(
  O, X, O,
  X, O, X,
  O, X, _,
  O
);
assert_equal(got, expected, "Tic Tac Toe constructor with O failed!");

// Basic playout result
expected = GmstArray(1, true, 1, 4, 7);
got = TicTacToeResult(1, true, 1, 4, 7);
assert_equal(got, expected, "Tic Tac Toe playout result failed!");

