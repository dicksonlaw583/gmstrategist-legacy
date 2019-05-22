///mcts_presample_empirical(@node, state, [ruleset,n])
/**
Randomize n times from the given state and tally the results,
then expand all the distinct moves and weight them according to frequency.
Return a node among the expanded nodes at random, weighted as above.
*/
// Capture parameters
var node = argument0,
    node_state = argument1,
    arg = argument2,
    ruleset = arg[0],
    rand_generator = ruleset[RULESET.SCR_GENERATE_RANDOM],
    n = arg[1];
// Tally up moves
var moveweights = ds_map_create(),
    moves_available = 0,
    moves = array_create(0);
repeat (n) {
  var move = script_execute(rand_generator, node_state),
      movestr = string(move);
  if (ds_map_exists(moveweights, movestr)) {
    moveweights[? movestr]++;
  } else {
    moveweights[? movestr] = 1;
    moves[moves_available++] = move;
  }
}
var weights = array_create(moves_available);
for (var i = moves_available-1; i >= 0; i--) {
  weights[i] = moveweights[? string(moves[i])]/n;
}
ds_map_destroy(moveweights);
// Compute information about the given state
var node_children = array_create(moves_available);
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

