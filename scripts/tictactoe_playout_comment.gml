///tictactoe_playout_comment(result)
var result = argument0;
if (result[1]) {
  switch (result[0]) {
    case 0: return "Player wins!";
    case 1: return "AI wins!";
    default: return "Draw!";
  }
} else {
  return "Unfinished game!";
}

