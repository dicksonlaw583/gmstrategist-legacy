///tictactoe_test_apply_move()

var _ = -1,
    O = 0,
    X = 1;
var state, move, expected_state, result;

// X player to play
state = TicTacToeState(
  _, _, _,
  _, _, _,
  _, _, _,
  X
);
move = 2;
expected_state = TicTacToeState(
  _, _, X,
  _, _, _,
  _, _, _,
  O
);
tictactoe_apply_move(state, move);
assert_equal(state, expected_state, "X player valid move did something unexpected!");

// O player to play
state = TicTacToeState(
  _, _, X,
  _, _, _,
  _, _, _,
  O
);
move = 3;
expected_state = TicTacToeState(
  _, _, X,
  O, _, _,
  _, _, _,
  X
);
tictactoe_apply_move(state, move);
assert_equal(state, expected_state, "O player valid move did something unexpected!");

