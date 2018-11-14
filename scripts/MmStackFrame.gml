///MmStackFrame(state_pickle, node, moves[], child_num, depth_left, alpha, beta, progress_total, progress_weight)
/**
A stack frame used in the evaluation of minimax.
*/
enum MM_STACK_FRAME {
  STATE_PICKLE,
  NODE,
  MOVES,
  CHILD_NUM,
  DEPTH,
  ALPHA,
  BETA,
  PROGRESS_TOTAL,
  PROGRESS_WEIGHT
}
{
  var stackframe = array_create(9);
  stackframe[0] = argument0;
  stackframe[1] = argument1;
  stackframe[2] = argument2;
  stackframe[3] = argument3;
  stackframe[4] = argument4;
  stackframe[5] = argument5;
  stackframe[6] = argument6;
  stackframe[7] = argument7;
  stackframe[8] = argument8;
  return stackframe;
}
