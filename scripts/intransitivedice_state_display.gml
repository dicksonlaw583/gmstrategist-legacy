///intransitivedice_state_display(state)
var nl = chr(10);
var s = argument0;
var hint = "Die A: 2, 2, 4, 4, 9, 9" + nl + "Die B: 1, 1, 6, 6, 8, 8" + nl + "Die C: 3, 3, 5, 5, 7, 7" + nl + nl;

switch (s[? "phase"]) {
  case "p0pick":
    return hint + "Your pick: ?";
  case "p1pick":
    return hint + "Your pick: " + chr(ord("A")+s[? "p0pick"]) + nl + "AI's pick: ?";
  case "p0roll":
  case "p1roll":
    return hint + "Your pick: " + chr(ord("A")+s[? "p0pick"]) + nl + "AI's pick: " + chr(ord("A")+s[? "p1pick"]) + nl + nl + "Rolling!";
  case "done":
    return hint + "Your roll: " + string(s[? "p0roll"]) + nl + "AI's roll: " + string(s[? "p1roll"]);
}
show_error("Invalid phase: " + string(s[? "phase"]), true);

