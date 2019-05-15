///MmNode(last_move, polarity, value, children)
/**
Build a new Minimax node.

MmNode[
  Move|undefined LAST_MOVE, // The last move made before this state (can be undefined if root)
  -1|1 POLARITY, //-1 = min node, 1 = max node
  Real VALUE, // Value of the node
  MmNode[] CHILDREN // Children nodes
]
*/
enum MM_NODE {
  LAST_MOVE,
  POLARITY,
  VALUE,
  CHILDREN
}
{
  var node = array_create(4);
  node[0] = argument0;
  node[1] = argument1;
  node[2] = argument2;
  node[3] = argument3;
  return node;
}
