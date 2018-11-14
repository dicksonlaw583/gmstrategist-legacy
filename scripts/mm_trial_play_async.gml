///mm_trial_play_async(ruleset, configs, text_gameset, max_depth, ai_output, ai_verbose)
/**
Allow the user to play against the preconfigured minimax tree in a closed blocking loop. For debug use.
The minimax tree is subject to the given max depth constraint.
ai_output and ai_verbose accept the same arguments as mm_output_ranked_moves().
Returns the instance ID of the asynchronous daemon.
*/
with (instance_create(0, 0, __obj_minimax_trial_play_daemon__)) {
  ruleset = argument0;
  configs = argument1;
  text_gameset = argument2;
  max_depth = argument3;
  ai_output = argument4;
  ai_verbose = argument5;
  event_user(14);
}
