///tictactoe_playout_result(state)
var state = argument0;

// Rows
if (state[0] == state[1] && state[0] == state[2] && state[0] != -1) {
  return TicTacToeResult(state[0], true, 0, 1, 2);
}
if (state[3] == state[4] && state[3] == state[5] && state[3] != -1) {
  return TicTacToeResult(state[3], true, 3, 4, 5);
}
if (state[6] == state[7] && state[6] == state[8] && state[6] != -1) {
  return TicTacToeResult(state[6], true, 6, 7, 8);
}
// Columns
if (state[0] == state[3] && state[0] == state[6] && state[0] != -1) {
  return TicTacToeResult(state[0], true, 0, 3, 6);
}
if (state[1] == state[4] && state[1] == state[7] && state[1] != -1) {
  return TicTacToeResult(state[1], true, 1, 4, 7);
}
if (state[2] == state[5] && state[2] == state[8] && state[2] != -1) {
  return TicTacToeResult(state[2], true, 2, 5, 8);
}
// Diagonals
if (state[0] == state[4] && state[0] == state[8] && state[0] != -1) {
  return TicTacToeResult(state[0], true, 0, 4, 8);
}
if (state[2] == state[4] && state[2] == state[6] && state[2] != -1) {
  return TicTacToeResult(state[2], true, 2, 4, 6);
}
// Non-final if any square is blank
for (var i = 0; i < 9; i++) {
  if (state[i] == -1) {
    return TicTacToeResult(0.5, false, undefined, undefined, undefined);
  }
}

// No squares blank and no wins
return TicTacToeResult(0.5, true, undefined, undefined, undefined);

