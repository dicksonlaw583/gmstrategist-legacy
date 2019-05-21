///gmst_itest_mm_root_state_async(phase)
switch (argument0) {
  case TEST_PHASE.SETUP:
    ___current_test_name___ = "Minimax async in root state";
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
    configs = MmConfigs(
      gmst_identity,
      tictactoe_heuristic,
      tictactoe_interpret_result_mm,
      undefined,
      false
    );
    state = TicTacToeState(
      _, _, _,
      _, _, _,
      _, _, O,
      X
    );
    tree = MmTree(state, ruleset, configs);
    tree_daemon = mm_evaluate_in_background(tree, 6);
    return true;
    break;
  case TEST_PHASE.RUNNING:
    if (tree_daemon.ready) {
      assert_equal(mm_get_best_move(tree_daemon.tree), 4, "Asynchronous Minimax in root state did not get perfect reply to corner tic-tac-toe opening!");
    }
    return tree_daemon.ready;
    break;
  case TEST_PHASE.CLEANUP:
    with (tree_daemon) instance_destroy();
    return true;
    break;
}
return false;
