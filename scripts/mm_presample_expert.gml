///mm_presample_expert(state, [scr_expert,arg_expert])
/**
Return an array of moves and their weights according to the expert script.
The expert script takes a state and an auxiliary argument,
and returns a nested array where arr[0][n] contains moves and arr[1][n] contains weights.
The weights should add to 1.
*/
// Capture parameters
var arg = argument1,
    scr_expert = arg[0],
    arg_expert = arg[1];
// Compute requirements
return script_execute(scr_expert, argument0, arg_expert);

