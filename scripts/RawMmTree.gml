///RawMmTree(root, root_pickle, ruleset, mm_configs)
/**
Build a raw minimax tree.

MmTree[
  MmNode ROOT, // Root node
  SerializedState ROOT_PICKLE, // Serialized root state
  Ruleset RULESET, // Ruleset
  MmConfigs CONFIGS, // Minimax configurations
]
*/
enum MM_TREE {
  ROOT, //MmNode
  ROOT_PICKLE, //SerializedState
  RULESET, //Ruleset
  CONFIGS //MmConfigs
}
{
  var tree = array_create(4);
  tree[0] = argument0;
  tree[1] = argument1;
  tree[2] = argument2;
  tree[3] = argument3;
  return tree;
}
