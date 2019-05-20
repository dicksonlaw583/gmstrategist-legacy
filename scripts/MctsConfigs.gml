///MctsConfigs(scr_select, scr_expand, scr_playout, scr_interpret, scr_reweight, scr_presample, node_state_mode)
/**
Build a new set of MCTS configurations.
Each parameter except for the last may be a single script ID, or a 2-entry array with a script ID followed by a parameter to pass into the script.

MctsConfigs[
  (MctsNode node, ? arg => MctsNode[]) SCR_SELECT, // Select sequence of children nodes, starting with the root.
  ? ARG_SELECT, // Arguments to pass to scr_select
  (@MctsNode node, State s, ? arg => MctsNode) SCR_EXPAND, // Expand the given non-random node and return a new node to play out
  ? ARG_EXPAND, // Arguments to pass to scr_expand
  (@State s, Int plies, Int ms, ? arg => PlayoutResult) SCR_PLAYOUT, // Play out the given state and return the result 
  ? ARG_PLAYOUT, // Arguments to pass to scr_playout
  (State s, PlayoutResult pr, Player p, ? arg => Real) SCR_INTERPRET, // Return the reward according to the playout from the perspective of the given player
  ? ARG_INTERPRET, // Arguments to pass to scr_interpret
  (@MctsNode node, MctsNode parent, Real reward, ? arg => Real) SCR_REWEIGHT, // Reweight the given node with the new incoming reward during back-propagation, return the new weight
  ? ARG_REWEIGHT, // Arguments to pass to scr_reweight
  (@MctsNode node, @State s, ? arg => MctsNode)|undefined SCR_PRESAMPLE, // Expand the given random node and return one of its nodes to play out
  ? ARG_PRESAMPLE, // Arguments to pass to scr_presample
  Bool NODE_STATE_MODE // Whether memos are stored in every node (true) or only at the tree's top level (false)
]
*/
enum MCTS_CONFIG {
  SCR_SELECT,
  ARG_SELECT,
  SCR_EXPAND,
  ARG_EXPAND,
  SCR_PLAYOUT,
  ARG_PLAYOUT,
  SCR_INTERPRET,
  ARG_INTERPRET,
  SCR_REWEIGHT,
  ARG_REWEIGHT,
  SCR_PRESAMPLE,
  ARG_PRESAMPLE,
  NODE_STATE_MODE
}
{
  var _configs = array_create(13);
  // For each argument before state mode:
  for (var i = 0; i < 6; i++) {
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
  _configs[MCTS_CONFIG.NODE_STATE_MODE] = argument[6];
  // Done
  return _configs;
}
