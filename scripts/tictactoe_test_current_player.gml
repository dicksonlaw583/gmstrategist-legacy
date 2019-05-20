///tictactoe_test_current_player()

var _ = -1,
    O = 0,
    X = 1;
var got, expected, fixture;

// Basic X test
fixture = TicTacToeState(
  X, O, X,
  O, X, O,
  X, O, _,
  X
);
expected = X;
got = tictactoe_current_player(fixture);
assert_equal(got, expected, "Tic Tac Toe current player with X failed!");

// Basic O test
fixture = TicTacToeState(
  O, X, O,
  X, O, X,
  O, X, _,
  O
);
expected = O;
got = tictactoe_current_player(fixture);
assert_equal(got, expected, "Tic Tac Toe current player with O failed!");

