///tictactoe_trial_play_mcts()
var state, tree, ruleset, configs;
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
  true
);
text_gameset = TextGameset(
  tictactoe_new_game,
  tictactoe_agency,
  tictactoe_player_name,
  tictactoe_state_display,
  tictactoe_move_output,
  tictactoe_move_input,
  tictactoe_playout_comment
);
mcts_trial_play(ruleset, configs, text_gameset, 8, 100, 1000, 500, TEXT_OUTPUT.MESSAGE, true);

