///tictactoe_apply_move(@state, move)
// Here we make apply a move in-place on the given state.
var state = argument0,
    move = argument1;
// Mark the square
state[@ move] = state[9];
// It is now the other player's turn (0 = O, 1 = X)
state[@ 9] = 1-state[9];
// Move successful
return true;

