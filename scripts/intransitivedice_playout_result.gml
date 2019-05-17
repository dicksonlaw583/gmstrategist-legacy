///intransitivedice_playout_result(state)
var state = argument0;
if (state[? "phase"] == "done") {
  return IntransitiveDiceResult(true, state[? "p0roll"], state[? "p1roll"]);
} else {
  return IntransitiveDiceResult(false);
}

