///MctsNode(last_move, last_player, weight, reward, visits, children[])
/**
Build a new MCTS node.

MctsNode[
  Move LAST_MOVE, // The last move made (can be undefined if root)
  Player|undefined LAST_PLAYER, // The last player to play (can be undefined if root or chance)
  Int WEIGHT, // Weight
  Int REWARD, // Cumulative reward
  Int VISITS, // Number of visits
  MctsNode[] CHILDREN, // Children nodes
]
*/
enum MCTS_NODE {
  LAST_MOVE,
  LAST_PLAYER,
  WEIGHT,
  REWARD,
  VISITS,
  CHILDREN,
}
{
  // Generate the base array
  var _node = array_create(6);
  _node[0] = argument0;
  _node[1] = argument1;
  _node[2] = argument2;
  _node[3] = argument3;
  _node[4] = argument4;
  _node[5] = argument5;
  // Done
  return _node;
}
