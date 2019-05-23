///mm_evaluate(@MmTree tree, Int max_depth)
/**
Fully expand the unbuilt minimax tree to the given maximum depth.
*/
{
  // Capture arguments
  var tree = argument0,
      max_depth = argument1,
      config = argument0[MM_TREE.CONFIGS],
      ruleset = argument0[MM_TREE.RULESET],
      node_state_mode = config[MM_CONFIGS.NODE_STATE_MODE];
  // Fake call stack
  var stack = ds_stack_create(),
      current_node = tree[MM_TREE.ROOT],
      available_moves = undefined,
      current_depth = max_depth,
      current_node_children = current_node[MM_NODE.CHILDREN],
      current_child_num = 0,
      alpha = undefined,
      beta = undefined,
      stackdir = true; // True for downwards, false for upwards
  // Start the main state
  var current_state;
  if (node_state_mode) {
    current_state = script_execute(ruleset[RULESET.SCR_DECODE], current_node[MM_NODE.MEMO], undefined);
  } else {
    current_state = script_execute(ruleset[RULESET.SCR_DECODE], tree[MM_TREE.ROOT_PICKLE], undefined);
  }
  if (is_undefined(current_node[MM_NODE.POLARITY])) {
    available_moves = script_execute(config[MM_CONFIGS.SCR_PRESAMPLE], current_state, config[MM_CONFIGS.ARG_PRESAMPLE]);
  } else {
    available_moves = script_execute(ruleset[RULESET.SCR_GENERATE_MOVES], current_state);
  }
  var is_final = script_execute(ruleset[RULESET.SCR_IS_FINAL], current_state);
  // As long as the stack isn't empty
  do {
    // Downwards
    if (stackdir) {
      // If final or max depth reached:
      if (current_depth == 0 || is_final) {
        // Final nodes get interpreted reward
        if (is_final) {
          current_node[@MM_NODE.VALUE] = script_execute(config[MM_CONFIGS.SCR_INTERPRET_RESULT], script_execute(ruleset[RULESET.SCR_PLAYOUT_RESULT], current_state), current_state, config[MM_CONFIGS.ARG_INTERPRET_RESULT]);
        }
        // Non-final nodes get heuristic reward
        else {
          current_node[@MM_NODE.VALUE] = script_execute(config[MM_CONFIGS.SCR_HEURISTIC], current_state, config[MM_CONFIGS.ARG_HEURISTIC]);
        }
        // Set evaluation movement upwards
        stackdir = false;
        // Clean up the current state
        /*if (!is_undefined(ruleset[RULESET.SCR_CLEANUP])) {
          script_execute(ruleset[RULESET.SCR_CLEANUP], current_state);
        }
        current_state = undefined;*/
        is_final = false;
      }
      // Not final and has depth to spare, expand
      else {
        // Create a stack frame remembering current state
        if (node_state_mode) {
          ds_stack_push(stack, MmStackFrame(
            undefined,
            current_node,
            available_moves,
            current_child_num,
            current_depth--,
            alpha,
            beta,
            0,
            0
          ));
        } else {
          ds_stack_push(stack, MmStackFrame(
            script_execute(ruleset[RULESET.SCR_ENCODE], current_state),
            current_node,
            available_moves,
            current_child_num,
            current_depth--,
            alpha,
            beta,
            0,
            0
          ));
        }
        // Apply current move
        var current_move, current_weight, subarray_temp;
        if (is_undefined(current_node[MM_NODE.POLARITY])) {
          subarray_temp = available_moves[0];
          current_move = subarray_temp[current_child_num];
          subarray_temp = available_moves[1];
          current_weight = subarray_temp[current_child_num];
        } else {
          current_move = available_moves[current_child_num];
          current_weight = undefined;
        }
        script_execute(ruleset[RULESET.SCR_APPLY_MOVE], current_state, current_move);
        // Expand first child node
        current_node_children = current_node[MM_NODE.CHILDREN];
        if (is_undefined(current_node_children)) {
          current_node_children = array_create(0);
          current_node[@MM_NODE.CHILDREN] = current_node_children;
        }
        if (node_state_mode) {
          current_node_children[@current_child_num] = MmNode(
            current_move,
            script_execute(config[MM_CONFIGS.SCR_POLARITY], script_execute(ruleset[RULESET.SCR_CURRENT_PLAYER], current_state), current_state, config[MM_CONFIGS.ARG_POLARITY]),
            undefined,
            undefined,
            script_execute(ruleset[RULESET.SCR_ENCODE], current_state),
            current_weight
          );
        } else {
          current_node_children[@current_child_num] = MmNode(
            current_move,
            script_execute(config[MM_CONFIGS.SCR_POLARITY], script_execute(ruleset[RULESET.SCR_CURRENT_PLAYER], current_state), current_state, config[MM_CONFIGS.ARG_POLARITY]),
            undefined,
            undefined,
            undefined,
            current_weight
          );
        }
        // Focus to current child
        current_node = current_node_children[current_child_num];
        // Determine if final
        is_final = script_execute(ruleset[RULESET.SCR_IS_FINAL], current_state);
        if (is_final) {
          available_moves = undefined;
        }
        else if (is_undefined(current_node[MM_NODE.POLARITY])) {
          available_moves = script_execute(config[MM_CONFIGS.SCR_PRESAMPLE], current_state, config[MM_CONFIGS.ARG_PRESAMPLE]);
        } else {
          available_moves = script_execute(ruleset[RULESET.SCR_GENERATE_MOVES], current_state);
        }
        current_child_num = 0;
        alpha = undefined;
        beta = undefined;
      }
    }
    // Upwards
    else {
      // Unpack the stack frame
      var current_stack_frame = ds_stack_pop(stack);
      current_node = current_stack_frame[MM_STACK_FRAME.NODE];
      available_moves = current_stack_frame[MM_STACK_FRAME.MOVES];
      current_depth = current_stack_frame[MM_STACK_FRAME.DEPTH];
      current_node_children = current_node[MM_NODE.CHILDREN];
      current_child_num = current_stack_frame[MM_STACK_FRAME.CHILD_NUM];
      alpha = current_stack_frame[MM_STACK_FRAME.ALPHA];
      beta = current_stack_frame[MM_STACK_FRAME.BETA];
      var current_child = current_node_children[current_child_num],
          ccv = current_child[MM_NODE.VALUE],
          available_moves_count = 0;
      // If it is a chance node:
      if (is_undefined(current_node[MM_NODE.POLARITY])) {
        // Correct the moves count to use the subarray
        available_moves_count = array_length_1d(available_moves[0]);
      }
      // If it is a max node:
      else if (current_node[MM_NODE.POLARITY]) {
        // Update node value and frame alpha
        if (is_undefined(current_node[MM_NODE.VALUE]) || ccv > current_node[MM_NODE.VALUE]) {
          current_node[@MM_NODE.VALUE] = ccv;
        }
        if (is_undefined(alpha) || ccv > alpha) {
          alpha = ccv;
        }
        available_moves_count = array_length_1d(available_moves);
      }
      // If it is a min node:
      else {
        // Update node value and frame beta
        if (is_undefined(current_node[MM_NODE.VALUE]) || ccv < current_node[MM_NODE.VALUE]) {
          current_node[@MM_NODE.VALUE] = ccv;
        }
        if (is_undefined(beta) || ccv < beta) {
          beta = ccv;
        }
        available_moves_count = array_length_1d(available_moves);
      }
      // If alpha-beta cutoff met or no more children
      if ((alpha > beta && !is_undefined(alpha) && !is_undefined(beta)) || current_child_num+1 == available_moves_count) {
        // Chance nodes update their value only after all of its children have been expanded
        if (is_undefined(current_node[MM_NODE.POLARITY])) {
          var chance_node_sum = 0,
              chance_node_child;
          for (var i = array_length_1d(current_node_children)-1; i >= 0; i--) {
            chance_node_child = current_node_children[i];
            chance_node_sum += chance_node_child[MM_NODE.WEIGHT]*chance_node_child[MM_NODE.VALUE];
          }
          current_node[@MM_NODE.VALUE] = chance_node_sum;
        }
        // Keep going up (no code required)
      }
      // Still more to evaluate
      else {
        // Decode the current frame's state
        var decode_result;
        if (node_state_mode) {
          decode_result = script_execute(ruleset[RULESET.SCR_DECODE], current_node[MM_NODE.MEMO], current_state);
        } else {
          decode_result = script_execute(ruleset[RULESET.SCR_DECODE], current_stack_frame[MM_STACK_FRAME.STATE_PICKLE], current_state);
        }
        if (!is_undefined(decode_result)) {
          if (!is_undefined(ruleset[RULESET.SCR_CLEANUP])) {
            script_execute(ruleset[RULESET.SCR_CLEANUP], current_state);
          }
          current_state = decode_result;
        }
        // Schedule to apply the next available move
        current_child_num++;
        // Change direction to downwards
        stackdir = true;
      }
    }
  } until (ds_stack_empty(stack) && !stackdir)
  // Clean up
  if (!is_undefined(ruleset[RULESET.SCR_CLEANUP])) {
    script_execute(ruleset[RULESET.SCR_CLEANUP], current_state);
  }
  current_state = undefined;
  ds_stack_destroy(stack);
}
