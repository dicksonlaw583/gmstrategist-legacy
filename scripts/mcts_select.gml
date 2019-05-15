///mcts_select(node, ?)
/**
Default selection policy.
Return an array of nodes in the selection, starting from the given node.
*/
{
  // Capture arguments
  var node = argument0,
      _ = argument1;
  // Get info on children of given node
  var node_children = node[MCTS_NODE.CHILDREN],
      node_children_count = array_length_1d(node_children);
  // Initialize selection path with the given node as first
  var select_path = array_create(1);
  select_path[0] = node;
  // As long as the current node has been expanded
  while (node_children_count > 0) {
    // Assume the first child node is the best until further evidence
    var best_node = node_children[0];
        best_weight = best_node[MCTS_NODE.WEIGHT];
    if (!is_undefined(best_weight)) {
      // Loop through children node for best nodes
      for (var i = node_children_count-1; i >= 1; i--) {
        var current_node = node_children[i];
        // An unexplored node beats everything else, stop searching
        if (is_undefined(current_node[MCTS_NODE.WEIGHT])) {
          best_node = current_node;
          break;
        }
        // Otherwise, an explored node with higher weight can replace the best node
        if (current_node[MCTS_NODE.WEIGHT] > best_weight) {
          best_node = current_node;
          best_weight = current_node[MCTS_NODE.WEIGHT];
        }
      }
    }
    // Append the best node to the selection path
    select_path[array_length_1d(select_path)] = best_node;
    // Prepare the next iteration (guaranteed to stop if it's an unexplored node)
    node = best_node;
    node_children = node[MCTS_NODE.CHILDREN];
    node_children_count = array_length_1d(node_children);
  }
  // Path done
  return select_path;
}
