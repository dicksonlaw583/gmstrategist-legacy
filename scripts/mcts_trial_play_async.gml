///mcts_trial_play_async(ruleset, configs, text_gameset, max_playout_plies, max_playout_ms, max_eval_playouts, max_eval_ms, ai_output, ai_verbose)
/**
Allow the user to play against the preconfigured MCTS tree via an asynchronous daemon. For debug use.
The MCTS tree is subject to the given time and evaluation constraints.
ai_output and ai_verbose accept the same arguments as mcts_output_ranked_moves().
Returns the instance ID of the asynchronous daemon.
*/
{
  // Capture arguments
  with (instance_create(0, 0, __obj_mcts_trial_play_daemon__)) {
    ruleset = argument0;
    configs = argument1;
    text_gameset = argument2;
    max_playout_plies = argument3;
    max_playout_ms = argument4;
    max_eval_playouts = argument5;
    max_eval_ms = argument6;
    ai_output = argument7;
    ai_verbose = argument8;
    event_user(14);
  }
}
