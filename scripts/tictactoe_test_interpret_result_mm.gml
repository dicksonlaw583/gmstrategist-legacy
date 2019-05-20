///tictactoe_test_interpret_result_mm()
var _ = -1,
    O = 0,
    X = 1;
var got, state, result;

// X player win
state = TicTacToeState(
  O, X, _,
  X, X, O,
  O, X, _,
  O
);
result = tictactoe_playout_result(state);
got = tictactoe_interpret_result_mm(result, state, undefined);
assert_equal(got, 1, "X player win gives wrong minimax interpretation!");

// O player win
state = TicTacToeState(
  O, X, O,
  X, O, O,
  O, X, X,
  X
);
result = tictactoe_playout_result(state);
got = tictactoe_interpret_result_mm(result, state, undefined);
assert_equal(got, 0, "O player win gives wrong minimax interpretation!");

// Draw
state = TicTacToeState(
  O, X, X,
  X, O, O,
  X, O, X,
  O
);
result = tictactoe_playout_result(state);
got = tictactoe_interpret_result_mm(result, state, undefined);
assert_equalish(got, 0.5, "Draw gives wrong minimax interpretation!");

// Non-final state
state = TicTacToeState(
  X, _, _,
  O, _, _,
  _, _, _,
  X
);
result = tictactoe_playout_result(state);
got = tictactoe_interpret_result_mm(result, state, undefined);
assert_equalish(got, 0.5, "Non-final state gives wrong minimax interpretation!");

