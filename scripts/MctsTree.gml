///MctsTree(state, ruleset, mcts_configs)
/**
Build an MCTS tree from the given state, ruleset and MCTS configs.
See RawMctsTree() for implementation details.
*/
{
  return RawMctsTree(
    MctsNode(
      undefined,
      undefined,
      0,
      0,
      0,
      undefined
    ),
    script_execute(argument1[RULESET.SCR_ENCODE], argument0),
    argument1,
    argument2
  );
}
