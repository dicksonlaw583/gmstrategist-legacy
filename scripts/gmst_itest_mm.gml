///gmst_itest_mm()
var _ = -1,
    O = 0,
    X = 1;
var state, tree, ruleset, configs;
var got, expected;

// Tic tac toe tests
ruleset = Ruleset(
  gmst_array_overwrite,
  gmst_array_clone,
  undefined,
  tictactoe_is_final,
  tictactoe_generate_moves,
  undefined,
  tictactoe_current_player,
  tictactoe_is_legal,
  tictactoe_apply_move,
  tictactoe_playout_result
);
// mm_evaluate() with node state mode
configs = MmConfigs(
  gmst_identity,
  tictactoe_heuristic,
  tictactoe_interpret_result_mm,
  undefined,
  true
);
state = TicTacToeState(
  O, _, _,
  _, _, _,
  _, _, _,
  X
);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 8);
expected = 4;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect reply to corner tic-tac-toe opening! (node state mode)");

// mm_evaluate() with root state mode
configs = MmConfigs(
  gmst_identity,
  tictactoe_heuristic,
  tictactoe_interpret_result_mm,
  undefined,
  false
);
state = TicTacToeState(
  X, _, _,
  _, _, _,
  _, _, _,
  O
);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 8);
expected = 4;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect reply to corner tic-tac-toe opening! (root state mode)");
