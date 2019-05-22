///intransitivedice_interpret_result_mcts(state, result, player, arg)
var result = argument[1];
if (argument[2] == 0) {
  return 1-result[1];
}
return result[1];

