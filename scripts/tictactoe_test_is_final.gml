///tictactoe_test_is_final()
{
  var _ = -1,
      O = 0,
      X = 1;
  var state;
  
  // X win is final
  state = TicTacToeState(
    O, X, _,
    X, X, O,
    O, X, _,
    O
  );
  assert(tictactoe_is_final(state), "X player win is not final!");
  
  // O win is final
  state = TicTacToeState(
    O, X, O,
    X, O, O,
    O, X, X,
    X
  );
  assert(tictactoe_is_final(state), "O player win is not final!");
  
  // Draw is final
  state = TicTacToeState(
    O, X, X,
    X, O, O,
    X, O, X,
    O
  );
  assert(tictactoe_is_final(state), "Draw is not final!");
  
  // Mid-game state is not final
  state = TicTacToeState(
    X, _, _,
    O, _, _,
    _, _, _,
    X
  );
  assert_fail(tictactoe_is_final(state), "Mid-game state is final!");
}
