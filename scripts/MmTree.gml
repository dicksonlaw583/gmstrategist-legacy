///MmTree(state, ruleset, mm_configs)
/**
Build a minimax tree from the given state, ruleset and configs.
See RawMmTree() for implementation details.
*/
{
  var node_state_mode = argument2[MM_CONFIGS.NODE_STATE_MODE];
  if (node_state_mode) {
    return RawMmTree(
      MmNode(
        undefined,
        script_execute(argument2[MM_CONFIGS.SCR_POLARITY], script_execute(argument1[RULESET.SCR_CURRENT_PLAYER], argument0), argument0, argument2[MM_CONFIGS.ARG_POLARITY]),
        undefined,
        undefined,
        script_execute(argument1[RULESET.SCR_ENCODE], argument0),
        undefined
      ),
      undefined,
      argument1,
      argument2
    );
  }
  return RawMmTree(
    MmNode(
      undefined,
      script_execute(argument2[MM_CONFIGS.SCR_POLARITY], script_execute(argument1[RULESET.SCR_CURRENT_PLAYER], argument0), argument0, argument2[MM_CONFIGS.ARG_POLARITY]),
      undefined,
      undefined,
      undefined,
      undefined
    ),
    script_execute(argument1[RULESET.SCR_ENCODE], argument0),
    argument1,
    argument2
  );
}
