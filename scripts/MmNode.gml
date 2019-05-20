///MmNode(last_move, polarity, value, children, memo, weight)
/**
Build a new Minimax node.

MmNode[
  Move|undefined LAST_MOVE, // The last move made before this state (can be undefined if root)
  Real|undefined POLARITY, // undefined = chance, cast to false = min, cast to true = max
  Real VALUE, // Value of the node
  MmNode[]|undefined CHILDREN, // Children nodes
  Memo|undefined MEMO, // Memo of the state at this point (undefined when node state mode is off)
  Real|undefined WEIGHT // The weight of this node (can be undefined if not chance)
]
*/
enum MM_NODE {
  LAST_MOVE,
  POLARITY,
  VALUE,
  CHILDREN,
  MEMO,
  WEIGHT
}
{
  var node = array_create(6);
  node[0] = argument[0];
  node[1] = argument[1];
  node[2] = argument[2];
  node[3] = argument[3];
  node[4] = argument[4];
  node[5] = argument[5];
  return node;
}
