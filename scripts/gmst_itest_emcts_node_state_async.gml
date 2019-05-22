///gmst_itest_emcts_node_state_async(phase)
var ruleset, configs, tree;
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
configs = MctsConfigs(
  mcts_select,
  GmstArray(mcts_expand, ruleset),
  GmstArray(mcts_playout, ruleset),
  intransitivedice_interpret_result_mcts,
  mcts_reweight,
  GmstArray(mcts_presample_empirical, ruleset, 30),
  true
);
switch (argument0) {
  case TEST_PHASE.SETUP:
    ___current_test_name___ = "eMCTS async in node state";
    states = GmstArray(
      IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined),
      IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined),
      IntransitiveDiceState("p1pick", 2, undefined, undefined, undefined)
    );
    current_state = 0;
    expected_outcomes = GmstArray(2, 0, 1);
    tree = MctsTree(states[0], ruleset, configs);
    tree_daemon = mcts_evaluate_in_background(tree, 4, 100, 1000, 10000);
    return true;
    break;
  case TEST_PHASE.RUNNING:
    if (tree_daemon.ready) {
      assert_equal(mcts_get_best_move(tree_daemon.tree), expected_outcomes[current_state], "Asynchronous MCTS in node state did not get perfect counter to die " + chr(ord("A")+current_state) + "!");
      if (++current_state < array_length_1d(states)) {
        with (tree_daemon) instance_destroy();
        tree = MctsTree(states[current_state], ruleset, configs);
        tree_daemon = mcts_evaluate_in_background(tree, 4, 100, 1000, 10000);
      }
    }
    return current_state >= array_length_1d(states);
    break;
  case TEST_PHASE.CLEANUP:
    for (var i = array_length_1d(states)-1; i >= 0; i--) {
      ds_map_destroy(states[i]);
    }
    with (tree_daemon) instance_destroy();
    return true;
    break;
}
return false;
