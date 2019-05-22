///gmst_itest_mcts_root_state_async(phase)
switch (argument0) {
  case TEST_PHASE.SETUP:
    ___current_test_name___ = "MCTS async in root state";
    var _ = -1,
        O = 0,
        X = 1;
    var ruleset, configs, state, tree;
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
      _, _, _,
      _, _, _,
      _, _, O,
      X
    );
    tree = MctsTree(state, ruleset, configs);
    tree_daemon = mcts_evaluate_in_background(tree, 8, 100, 2000, 10000);
    return true;
    break;
  case TEST_PHASE.RUNNING:
    if (tree_daemon.ready) {
      assert_equal(mcts_get_best_move(tree_daemon.tree), 4, "Asynchronous MCTS in root state did not get perfect reply to corner tic-tac-toe opening!");
    }
    return tree_daemon.ready;
    break;
  case TEST_PHASE.CLEANUP:
    with (tree_daemon) instance_destroy();
    return true;
    break;
}
return false;
