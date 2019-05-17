///intransitivedice_generate_random(state)
var state = argument0;
var pick;
switch (state[? "phase"]) {
  case "p0roll":
    pick = state[? "p0pick"];
    break;
  case "p1roll":
    pick = state[? "p1pick"];
    break;
  default:
    show_error("Invalid phase for randomizer: " + state[? "phase"], true);
}
switch (pick) {
  case 0:
    return choose(2, 2, 4, 4, 9, 9);
  case 1:
    return choose(1, 1, 6, 6, 8, 8);
  case 2:
    return choose(3, 3, 5, 5, 7, 7);
  default:
    show_error("Invalid pick: " + string(pick), true);
}

