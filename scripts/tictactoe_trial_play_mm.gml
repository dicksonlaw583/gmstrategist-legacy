///tictactoe_trial_play_mm()
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
configs = MmConfigs(
  gmst_identity,
  tictactoe_heuristic,
  tictactoe_interpret_result_mm,
  undefined,
  false
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
mm_trial_play(ruleset, configs, text_gameset, 6, TEXT_OUTPUT.MESSAGE, true);

