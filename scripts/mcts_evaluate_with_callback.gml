///mcts_evaluate_with_callback(@tree, max_playout_plies, max_playout_ms, max_playouts, max_ms, scr_callback, arg_callback)
/**
Evaluate the given tree in the background using the given limit on plies per playout, time per playout, total # of playouts and total time.
When evaluation completes, the script scr_callback will be called, with the best move in the first argument and arg_callback as the second argument.
scr_callback can optionally return a true value to keep the daemon instance alive, otherwise it will be automatically destroyed.
Return the daemon instance performing this process. It has a progress variable in [0, 1] and a Boolean done variable.
*/
{
  with (instance_create(0, 0, __obj_mcts_daemon__)) {
    tree = argument0;
    max_playout_plies = argument1;
    max_playouts = argument3;
    max_playout_ms = argument2;
    max_ms = argument4;
    callback = argument5;
    callback_arg = argument6;
    event_user(0);
    return id;
  }
}
