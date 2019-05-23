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


// Intransitive Dice tests
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
// mm_evaluate() with node state mode (expecti-minimax)
configs = MmConfigs(
  gmst_identity,
  intransitivedice_heuristic,
  intransitivedice_interpret_result_mm,
  GmstArray(mm_presample_empirical, ruleset, 60),
  true
);
state = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 4);
expected = 2;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect counter to die A! (node state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 4);
expected = 0;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect counter to die B! (node state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 2, undefined, undefined, undefined);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 4);
expected = 1;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect counter to die C! (node state mode)");
ds_map_destroy(state);
// mm_evaluate() with root state mode (expecti-minimax)
configs = MmConfigs(
  gmst_identity,
  intransitivedice_heuristic,
  intransitivedice_interpret_result_mm,
  GmstArray(mm_presample_empirical, ruleset, 60),
  false
);
state = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 4);
expected = 2;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect counter to die A! (root state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 4);
expected = 0;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect counter to die B! (root state mode)");
ds_map_destroy(state);
state = IntransitiveDiceState("p1pick", 2, undefined, undefined, undefined);
tree = MmTree(state, ruleset, configs);
mm_evaluate(tree, 4);
expected = 1;
got = mm_get_best_move(tree)
assert_equal(got, expected, "mm_evaluate failed to get perfect counter to die C! (root state mode)");
ds_map_destroy(state);
