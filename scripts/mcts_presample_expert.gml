///mcts_presample_expert(@node, state, [scr_expert,arg])
/**
Expand all listed chance moves and weight them according to an expert script.
The expert script takes a state and an auxiliary argument,
and returns a nested array where arr[0][n] contains moves and arr[1][n] contains weights.
The weights should add to 1.
Return a node among the expanded nodes at random, weighted as above.
*/
// Capture parameters
var node = argument0,
    node_state = argument1,
    arg = argument2;
// Compute information about the given state
var expert_answer = script_execute(arg[0], node_state, arg[1]),
    moves = expert_answer[0],
    weights = expert_answer[1],
    moves_available = array_length_1d(moves),
    node_children = array_create(moves_available);
// For each available move
for (var i = 0; i < moves_available; i++) {
  // Add a child into the node's list of children
  node_children[@i] = MctsNode(
    moves[i],
    undefined, // Previous node must have been undefined to reach this
    weights[i],
    0,
    0,
    undefined,
    undefined,
    undefined // Let the next expansion take care of this
  );
}
// Pick a random weighted child node
var rand = random(1);
for (var i = moves_available-1; i >= 1; i--) {
  var rand_child = node_children[i];
  rand -= rand_child[MCTS_NODE.WEIGHT];
  if (rand <= 0) {
    return rand_child;
  }
}
return node_children[0];

