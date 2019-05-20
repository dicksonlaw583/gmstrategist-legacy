///tictactoe_interpret_result_mcts(state, result, player, arg)
var result = argument[1];
if (argument[2] == 1) {
  return result[0];
}
return 1-result[0];

