///intransitivedice_playout_comment(result)
var result = argument0;
if (result[0]) {
  switch (result[1]) {
    case 0: return "Player wins!";
    case 1: return "AI wins!";
    default: return "Draw!";
  }
} else {
  return "Unfinished game!";
}

