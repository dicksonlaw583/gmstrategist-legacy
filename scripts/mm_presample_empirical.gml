///mm_presample_empirical(state, [ruleset,n])
/**
Randomize n times from the given state and tally the results,
then count all the distinct moves and weight them according to frequency.
Return a nested array where arr[0][n] contain moves and arr[1][n] contains weights.
The weights will add up to 1.
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
// Return the array of results
var results = array_create(2);
results[0] = moves;
results[1] = weights;
return results;

