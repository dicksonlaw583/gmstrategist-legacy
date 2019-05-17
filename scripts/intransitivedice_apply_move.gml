///intransitivedice_apply_move(@state, move)
var state = argument0,
    move = argument1,
    phase = state[? "phase"];

// Check for phase and move onto the next one
switch (phase) {
  case "p0pick":
    state[? "phase"] = "p1pick";
    break;
  case "p1pick":
    state[? "phase"] = "p0roll";
    break;
  case "p0roll":
    state[? "phase"] = "p1roll";
    break;
  case "p1roll":
    state[? "phase"] = "done";
    break;
  default:
    show_error("Invalid phase: " + phase, true);
}

// Starting phase indicates which key to set the move
state[? phase] = move;

