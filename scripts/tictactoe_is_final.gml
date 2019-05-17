///tictactoe_is_final(state)
var state = argument0;

// Rows
if (state[0] == state[1] && state[0] == state[2] && state[0] != -1) {
  return true;
}
if (state[3] == state[4] && state[3] == state[5] && state[3] != -1) {
  return true;
}
if (state[6] == state[7] && state[6] == state[8] && state[6] != -1) {
  return true;
}
// Columns
if (state[0] == state[3] && state[0] == state[6] && state[0] != -1) {
  return true;
}
if (state[1] == state[4] && state[1] == state[7] && state[1] != -1) {
  return true;
}
if (state[2] == state[5] && state[2] == state[8] && state[2] != -1) {
  return true;
}
// Diagonals
if (state[0] == state[4] && state[0] == state[8] && state[0] != -1) {
  return true;
}
if (state[2] == state[4] && state[2] == state[6] && state[2] != -1) {
  return true;
}
// Non-final if any square is blank
for (var i = 0; i < 9; i++) {
  if (state[i] == -1) {
    return false;
  }
}

// No squares blank and no wins
return true;

