///intransitivedice_current_player(state)
switch (argument0[? "phase"]) {
  case "p0pick":
    return 0;
  case "p1pick":
    return 1;
}
return undefined;

