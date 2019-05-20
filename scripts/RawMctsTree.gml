///RawMctsTree(root, root_pickle, ruleset, mcts_configs)
/**
This is the low-level constructor for MctsTree. Use MctsTree() for non-testing situations.

MctsTree[
  MctsNode ROOT, // Root node
  SerializedState|undefined ROOT_PICKLE, // Serialized version of root state (undefined when node state mode is on)
  Ruleset RULESET, // Ruleset
  MctsConfigs CONFIGS, // MCTS configurations
]
*/
enum MCTS_TREE {
  ROOT,
  ROOT_PICKLE,
  RULESET,
  CONFIGS
}
{
  // Generate the base array
  var _tree = array_create(4);
  _tree[0] = argument0;
  _tree[1] = argument1;
  _tree[2] = argument2;
  _tree[3] = argument3;
  // Done
  return _tree;
}
