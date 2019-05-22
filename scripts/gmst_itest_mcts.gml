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
mcts_evaluate(tree, 8, 100, 1200, 1000);
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
mcts_evaluate(tree, 8, 100, 1000, 1000);
expected = 4;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect reply to corner tic-tac-toe opening! (root state mode)");

// Intransitive dice
ruleset = Ruleset(
  gmst_json_decode,
  gmst_json_encode,
  gmst_json_cleanup,
  intransitivedice_is_final,
  intransitivedice_generate_moves,
  intransitivedice_generate_random,
  intransitivedice_current_player,
  intransitivedice_is_legal,
  intransitivedice_apply_move,
  intransitivedice_playout_result
);
// mcts_evaluate() with node state mode
configs = MctsConfigs(
  mcts_select,
  GmstArray(mcts_expand, ruleset),
  GmstArray(mcts_playout, ruleset),
  intransitivedice_interpret_result_mcts,
  mcts_reweight,
  GmstArray(mcts_presample_empirical, ruleset, 30),
  true
);
state = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 4, 100, 1000, 10000);
expected = 2;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect counter to die A! (node state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 4, 100, 1000, 10000);
expected = 0;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect counter to die B! (node state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 2, undefined, undefined, undefined);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 4, 100, 1000, 10000);
expected = 1;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect counter to die C! (node state mode)");
ds_map_destroy(state);
// mcts_evaluate() with root state mode
configs = MctsConfigs(
  mcts_select,
  GmstArray(mcts_expand, ruleset),
  GmstArray(mcts_playout, ruleset),
  intransitivedice_interpret_result_mcts,
  mcts_reweight,
  GmstArray(mcts_presample_empirical, ruleset, 30),
  false
);
state = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 4, 100, 1000, 10000);
expected = 2;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect counter to die A! (root state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 4, 100, 1000, 10000);
expected = 0;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect counter to die B! (root state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 2, undefined, undefined, undefined);
tree = MctsTree(state, ruleset, configs);
mcts_evaluate(tree, 4, 100, 1000, 10000);
expected = 1;
got = mcts_get_best_move(tree)
assert_equal(got, expected, "mcts_evaluate failed to get perfect counter to die C! (root state mode)");
ds_map_destroy(state);
