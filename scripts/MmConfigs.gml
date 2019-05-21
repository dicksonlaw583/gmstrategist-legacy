///MmConfigs(scr_polarity, scr_heuristic, scr_interpret_result, scr_presample, node_state_mode)
/**
Build a new set of Minimax configurations.

MmConfigs[
  (Player p, State s, ? arg => Bool|undefined) SCR_POLARITY, // Return falsy value if the player is minimizing, truthy value if the player is maximizing, undefined if randomizing
  ? ARG_POLARITY, // Arguments to pass to scr_polarity
  (State s, ? arg => Real) SCR_HEURISTIC, // The heuristic for evaluating a state
  ? ARG_HEURISTIC, // Arguments to pass to the heuristic
  (PlayoutResult pr, State s, ? arg => Real) SCR_INTERPRET_RESULT, // Return the reward according to the playout
  ? ARG_INTERPRET_RESULT, // Arguments to pass to scr_interpret_result
  (State s, ? arg => [Move[],Real[]])|undefined SCR_PRESAMPLE, // Return a nested array with [0][n] for a move and [1][n] for its weight
  ? ARG_PRESAMPLE, // Arguments to pass to scr_presample
  Bool NODE_STATE_MODE // Whether memos are stored in every node (true) or only at the tree's top level (false)
]
*/
enum MM_CONFIGS {
  SCR_POLARITY,
  ARG_POLARITY,
  SCR_HEURISTIC,
  ARG_HEURISTIC,
  SCR_INTERPRET_RESULT,
  ARG_INTERPRET_RESULT,
  SCR_PRESAMPLE,
  ARG_PRESAMPLE,
  NODE_STATE_MODE
}
{
  var _configs = array_create(9);
  // For each argument before node state mode:
  for (var i = 0; i < 4; i++) {
    var _arg = argument[i];
    // If the argument is an array:
    if (is_array(_arg)) {
      // First entry is the script
      _configs[i << 1] = _arg[0];
      // If the array is 3 entries or more, the slice [1..n-1] is the parameter
      var _arglen = array_length_1d(_arg);
      if (_arglen > 2) {
        var _configarg = array_create(_arglen-1);
        array_copy(_configarg, 0, _arg, 1, _arglen-1);
        _configs[(i<<1)+1] = _configarg;
      }
      // Otherwise, the second entry is the parameter
      else {
        _configs[(i<<1)+1] = _arg[1];
      }
    }
    // Otherwise, the provided argument is the script, and the parameter is undefined
    else {
      _configs[i << 1] = _arg;
      _configs[(i<<1)+1] = undefined;
    }
  }
  // Node state mode
  _configs[MM_CONFIGS.NODE_STATE_MODE] = argument[4];
  // Done
  return _configs;
}
