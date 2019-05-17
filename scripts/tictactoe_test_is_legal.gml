///tictactoe_test_apply_move()
var _ = -1,
    O = 0,
    X = 1;
var state, move;

// X player to play, valid move
state = TicTacToeState(
  _, _, _,
  _, _, _,
  _, _, _,
  X
);
move = 2;
assert(tictactoe_is_legal(state, move), "X player valid move misidentified!");

// X player to play, invalid move
state = TicTacToeState(
  _, _, X,
  O, _, _,
  _, _, _,
  X
);
move = 2;
assert_fail(tictactoe_is_legal(state, move), "X player invalid move misidentified!");

// O player to play, valid move
state = TicTacToeState(
  _, _, X,
  _, _, _,
  _, _, _,
  O
);
move = 3;
assert(tictactoe_is_legal(state, move), "O player valid move misidentified!");

// O player to play, invalid move
state = TicTacToeState(
  _, _, X,
  O, _, _,
  _, _, _,
  O
);
move = 2;
assert_fail(tictactoe_is_legal(state, move), "O player invalid move misidentified!");

