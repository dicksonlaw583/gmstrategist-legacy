///IntransitiveDiceResult(finished, <p0roll, p1roll>)
var finished;
var roll0 = undefined,
    roll1 = undefined;
switch (argument_count) {
  case 3:
    if (argument[0]) {
      roll0 = argument[1];
      roll1 = argument[2];
    }
  case 1:
    finished = argument[0];
    break;
  default:
    show_error("Expected 1 or 3 arguments, got " + string(argument_count) + ".", true);
    break;
}
if (finished) {
  if (roll0 > roll1) {
    return GmstArray(true, 0, roll0, roll1);
  }
  return GmstArray(true, 1, roll0, roll1);
}
return GmstArray(false, 0.5, roll0, roll1);
