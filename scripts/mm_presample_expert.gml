///mm_presample_expert(state, [scr_expert,arg_expert])
/**
Return an array of new MmNodes and weight them according to the expert script.
The expert script takes a state and an auxiliary argument,
and returns a nested array where arr[0][n] contains moves and arr[1][n] contains weights.
The weights should add to 1.
*/
// Capture parameters
var arg = argument1,
    scr_expert = arg[0],
    arg_expert = arg[1];
// Compute requirements
var result = script_execute(scr_expert, argument0, arg_expert),
    moves = result[0],
    weights = result[1],
    moves_available = array_length_1d(moves),
    new_children = array_create(moves_available);
// For each available move
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

