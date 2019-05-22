///intransitivedice_move_input(str)
if (!is_string(argument0) || string_length(argument0) != 1) return undefined;
var input = string_upper(argument0);
switch (input) {
  case "A": return 0;
  case "B": return 1;
  case "C": return 2;
  default: return undefined;
}

