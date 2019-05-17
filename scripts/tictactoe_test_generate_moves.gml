///tictactoe_test_generate_moves()
var _ = -1,
    O = 0,
    X = 1;
var state, got_moves, expected_moves;

// All moves for opening board
state = TicTacToeState(
  _, _, _,
  _, _, _,
  _, _, _,
  X
);
expected_moves = GmstArray(0, 1, 2, 3, 4, 5, 6, 7, 8);
got_moves = tictactoe_generate_moves(state);
assert_equal(array_length_1d(got_moves), array_length_1d(expected_moves), "Wrong number of moves for opening board!");
for (var i = 0; i < array_length_1d(expected_moves); i++) {
  assert_contains(got_moves, expected_moves[i], "Can't find the move specified for opening board!");
}

// Some moves for mid-game board
state = TicTacToeState(
  X, O, _,
  O, X, _,
  _, _, _,
  O
);
expected_moves = GmstArray(2, 5, 6, 7, 8);
got_moves = tictactoe_generate_moves(state);
assert_equal(array_length_1d(got_moves), array_length_1d(expected_moves), "Wrong number of moves for mid-game board!");
for (var i = 0; i < array_length_1d(expected_moves); i++) {
  assert_contains(got_moves, expected_moves[i], "Can't find the move specified for mid-game board!");
}

// Some moves for late-game board
state = TicTacToeState(
  X, O, O,
  O, X, X,
  O, X, _,
  O
);
expected_moves = GmstArray(8);
got_moves = tictactoe_generate_moves(state);
assert_equal(array_length_1d(got_moves), array_length_1d(expected_moves), "Wrong number of moves for late-game board!");
for (var i = 0; i < array_length_1d(expected_moves); i++) {
  assert_contains(got_moves, expected_moves[i], "Can't find the move specified for late-game board!");
}

