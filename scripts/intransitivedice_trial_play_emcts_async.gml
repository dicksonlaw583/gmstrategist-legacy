///intransitivedice_trial_play_emcts_async()
var state, tree, ruleset, configs;
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
  false
);
text_gameset = TextGameset(
  intransitivedice_new_game,
  intransitivedice_agency,
  intransitivedice_player_name,
  intransitivedice_state_display,
  intransitivedice_move_output,
  intransitivedice_move_input,
  intransitivedice_playout_comment
);
mcts_trial_play_async(ruleset, configs, text_gameset, 5, 100, 1000, 1000, TEXT_OUTPUT.MESSAGE_ASYNC, true);
