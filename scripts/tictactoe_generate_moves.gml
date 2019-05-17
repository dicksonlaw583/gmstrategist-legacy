///tictactoe_generate_moves(state)
// Here we generate an array of available moves from the given game state.
// With Tic-Tac-Toe, this is the list of open squares. Here we represent them as row-major index numbers:
//  0 | 1 | 2
// ---+---+---
//  3 | 4 | 5 
// ---+---+---
//  6 | 7 | 8

var state = argument0;
var moves = array_create(0),
    move_count = 0;

// Available moves are blank squares
for (var i = 0; i < 9; i++) {
  if (state[i] == -1) {
    moves[move_count++] = i;
  }
}

// Done
return moves

