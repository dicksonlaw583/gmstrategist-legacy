///intransitivedice_generate_moves(state)
var state = argument0;
switch (state[? "phase"]) {
  case "p0pick":
    return GmstArray(0, 1, 2);
  case "p1pick":
    var p0pick = state[? "p0pick"],
        p1picks = array_create(2),
        ii = 0;
    for (var i = 0; i <= 2; i++) {
      if (i != p0pick) {
        p1picks[ii++] = i;
      }
    }
    return p1picks;
    break;
  default:
    show_error("Invalid phase for player: " + state[? "phase"], true);
}

