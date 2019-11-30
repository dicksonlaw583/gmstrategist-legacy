///mcts_select_noisy(node, noisefrac)
/**
Modified selection policy that selects random child with probability <noisefrac>, highest weighted child otherwise.
Return an array of nodes in the selection, starting from the given node.
*/
{
  // Capture arguments
  var node = argument0,
      signalfrac = 1-argument1;
  // Get info on children of given node
  var node_children = node[MCTS_NODE.CHILDREN],
      node_children_count;
  // Initialize selection path with the given node as first
  var select_path = array_create(1);
  select_path[0] = node;
  if (is_undefined(node_children)) {
    return select_path;
  } else {
    node_children_count = array_length_1d(node_children);
  }
  // As long as the current node has been expanded
  while (node_children_count > 0) {
    var selected_node, best_weight;
    // If the current node is a chance node
    if (is_undefined(node[MCTS_NODE.PLAYER])) {
      // Choose one of the child nodes by weight
      selected_node = node_children[node_children_count-1];
      var rand = random(1);
      for (var i = node_children_count-1; i >= 0; i--) {
        selected_node = node_children[node_children_count-1];
        rand -= selected_node[MCTS_NODE.WEIGHT];
        if (rand <= 0) break;
      }
    }
    // If the current node is a standard node
    else {
      // Use conventional selection with 1-noisefrac probability
      if (random(1) < signalfrac) {
        // Assume the first child node is the best until further evidence
        selected_node = node_children[0];
        best_weight = selected_node[MCTS_NODE.WEIGHT];
        if (!is_undefined(best_weight)) {
          // Loop through children node for best nodes
          for (var i = node_children_count-1; i >= 1; i--) {
            var current_node = node_children[i];
            // An unexplored node beats everything else, stop searching
            if (is_undefined(current_node[MCTS_NODE.WEIGHT])) {
              selected_node = current_node;
              break;
            }
            // Otherwise, an explored node with higher weight can replace the best node
            if (current_node[MCTS_NODE.WEIGHT] > best_weight) {
              selected_node = current_node;
              best_weight = current_node[MCTS_NODE.WEIGHT];
            }
          }
        }
      }
      // Random pick with noisefrac probability
      else {
        selected_node = node_children[irandom(node_children_count-1)];
      }
    }
    // Append the best node to the selection path
    select_path[array_length_1d(select_path)] = selected_node;
    // Prepare the next iteration (guaranteed to stop if it's an unexplored node)
    node = selected_node;
    node_children = node[MCTS_NODE.CHILDREN];
    if (is_undefined(node_children)) {
      return select_path;
    } else {
      node_children_count = array_length_1d(node_children);
    }
  }
  // Path done
  return select_path;
}
