///mm_presample_empirical(state, [ruleset,n])
/**
Randomize n times from the given state and tally the results,
then expand all the distinct moves and weight them according to frequency.
Return an array of new MmNodes.
*/
// Capture parameters
var state = argument0,
    arg = argument1,
    ruleset = arg[0],
    rand_generator = ruleset[RULESET.SCR_GENERATE_RANDOM],
    n = arg[1];
// Tally up moves
var moveweights = ds_map_create(),
    moves_available = 0,
    moves = array_create(0);
repeat (n) {
  var move = script_execute(rand_generator, state),
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
// For each available move
var new_children = array_create(moves_available);
for (var i = moves_available-1; i >= 0; i--) {
  new_children[@i] = MmNode(
    moves[i],
    undefined, // Previous node must have been undefined to play
    0,
    undefined,
    undefined, // Let the next expansion take care of this
    weights[i]
  );
}
// Return the array of new children
return new_children;

