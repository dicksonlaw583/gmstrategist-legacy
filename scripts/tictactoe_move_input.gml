///tictactoe_move_input(str)
if (!is_string(argument0) || string_length(argument0) != 2) return undefined;
var input = string_upper(argument0);
var xx, yy;
switch (string_char_at(input, 1)) {
  case "A": xx = 0; break;
  case "B": xx = 1; break;
  case "C": xx = 2; break;
  default: return undefined;
}
switch (string_char_at(input, 2)) {
  case "1": yy = 0; break;
  case "2": yy = 1; break;
  case "3": yy = 2; break;
  default: return undefined;
}
return yy*3+xx;

