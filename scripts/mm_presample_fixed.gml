///mm_presample_fixed(state, arg)
/**
Return an array of new MmNodes and weight them in the specified arg.
arg[0][n] contain the moves, and arg[1][n] contain the weights in (0,1).
The weights should add to 1.
*/
// Capture parameters
var arg = argument[1],
    moves = arg[0],
    weights = arg[1];
// Compute requirements
var moves_available = array_length_1d(moves),
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

