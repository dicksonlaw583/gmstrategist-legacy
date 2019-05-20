///MctsTree(state, ruleset, mcts_configs)
/**
Build an MCTS tree from the given state, ruleset and MCTS configs.
See RawMctsTree() for implementation details.
*/
{
  var node_state_mode = argument2[MCTS_CONFIG.NODE_STATE_MODE];
  if (node_state_mode) {
    return RawMctsTree(
      MctsNode(
        undefined,
        undefined,
        0,
        0,
        0,
        undefined,
        script_execute(argument1[RULESET.SCR_ENCODE], argument0),
        undefined
      ),
      undefined,
      argument1,
      argument2
    );
  }
  return RawMctsTree(
    MctsNode(
      undefined,
      undefined,
      0,
      0,
      0,
      undefined,
      undefined,
      undefined
    ),
    script_execute(argument1[RULESET.SCR_ENCODE], argument0),
    argument1,
    argument2
  );
}
