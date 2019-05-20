///MctsNode(last_move, last_player, weight, reward, visits, children[], memo, player)
/**
Build a new MCTS node.

MctsNode[
  Move LAST_MOVE, // The last move made (can be undefined if root)
  Player|undefined LAST_PLAYER, // The last player to play (can be undefined if root or chance)
  Int WEIGHT, // Weight
  Int REWARD, // Cumulative reward
  Int VISITS, // Number of visits
  MctsNode[]|undefined CHILDREN, // Children nodes
  Memo|undefined MEMO, // Memo of the state at this point (undefined when node state mode is off)
  Player|undefined PLAYER // The current player about to play (can be undefined if chance)
]
*/
enum MCTS_NODE {
  LAST_MOVE,
  LAST_PLAYER,
  WEIGHT,
  REWARD,
  VISITS,
  CHILDREN,
  MEMO,
  PLAYER
}
{
  // Generate the base array
  var _node = array_create(8);
  _node[0] = argument[0];
  _node[1] = argument[1];
  _node[2] = argument[2];
  _node[3] = argument[3];
  _node[4] = argument[4];
  _node[5] = argument[5];
  _node[6] = argument[6];
  _node[7] = argument[7];
  // Done
  return _node;
}
