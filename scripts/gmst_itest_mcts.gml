///gmst_itest_mcts()
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
// mcts_evaluate() with node state mode
configs = MctsConfigs(
  mcts_select,
  GmstArray(mcts_expand, ruleset),
  GmstArray(mcts_playout, ruleset),
  tictactoe_interpret_result_mcts,
  mcts_reweight,
  undefined,
  true
);
state = TicTacToeState(
  O, _, _,
  _, _, _,
  _, _, _,
  X
);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 8, 100, 1000, 500);
expected = 4;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect reply to corner tic-tac-toe opening! (node state mode)");
// mcts_evaluate() with root state mode
configs = MctsConfigs(
  mcts_select,
  GmstArray(mcts_expand, ruleset),
  GmstArray(mcts_playout, ruleset),
  tictactoe_interpret_result_mcts,
  mcts_reweight,
  undefined,
  false
);
state = TicTacToeState(
  X, _, _,
  _, _, _,
  _, _, _,
  O
);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 8, 100, 1000, 500);
expected = 4;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect reply to corner tic-tac-toe opening! (root state mode)");
