///intransitivedice_is_legal(state, move)
var state = argument0,
    move = argument1;
var pick;

// Check validity of moves on most phases (except rolls)
switch (state[? "phase"]) {
  case "p0pick":
    return move == 0 || move == 1 || move == 2;
  case "p1pick":
    return (move != state[? "p0pick"]) && (move == 0 || move == 1 || move == 2);
  case "p0roll":
    pick = state[? "p0pick"];
    break;
  case "p1roll":
    pick = state[? "p1pick"];
    break;
  case "done":
    return false;
}

// Check validity of rolls:
switch (pick) {
  case 0:
    return move == 2 || move == 4 || move == 9;
  case 1:
    return move == 1 || move == 6 || move == 8;
  case 2:
    return move == 3 || move == 5 || move == 7;
}

// Something is really wrong, can't be legal
return false;

