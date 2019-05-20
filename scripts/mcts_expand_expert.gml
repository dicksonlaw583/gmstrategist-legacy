///mcts_expand_expert(@node, state, [ruleset;scr_expert;arg])
/**
Expand the array of moves returned by the given expert script, then return the first expanded node.
The expert script takes the state as the first argument and arg as the second argument.
*/
{
  // Capture parameters
  var node = argument0,
      node_state = argument1,
      ruleset = argument2[0],
      scr_expert = argument2[1],
      arg_expert = argument2[2];
  // Use the given expert script to get recommended moves
  var moves = script_execute(scr_expert, node_state, arg_expert),
      moves_available = array_length_1d(moves),
      last_player = script_execute(ruleset[RULESET.SCR_CURRENT_PLAYER], node_state),
      node_children = array_create(moves_available);
  node[@MCTS_NODE.PLAYER] = last_player;
  // If there are no more moves, return undefined right away
  if (moves_available == 0) {
    return undefined;
  }
  // For each available move
  for (var i = moves_available-1; i >= 0; i--) {
    var move = moves[i];
    // Add a child into the node's list of children
    // Don't worry about the state pickle, the evaluator will take care of that
    node_children[@i] = MctsNode(
      move,
      last_player,
      undefined, // << This is important: It marks an unexplored node!
      0,
      0,
      undefined,
      undefined,
      undefined
    );
  }
  // Set node's children
  node[@MCTS_NODE.CHILDREN] = node_children;
  // Return the first child node
  return node_children[0];
}
