///Ruleset(scr_decode, scr_encode, scr_cleanup, scr_is_final, scr_generate_moves, scr_generate_random, scr_current_player, scr_is_legal, scr_apply_move, scr_playout_result)
/**
Ruleset[
  (Memento m, @State|undefined s => State|undefined) SCR_DECODE, // Unpickle serialized state
  (State s => Memento) SCR_ENCODE // Pickle live state
  (@State s => -) SCR_CLEANUP, // Free the live state
  (State s => Bool), SCR_IS_FINAL // Return whether the state is a finished game
  (State s => Move[]) SCR_GENERATE_MOVES, // Generate all moves from the current state, without checking player or finality
  (State s => Move)|undefined SCR_GENERATE_RANDOM, // Generate a random result from the current state, without checking player or finality
  (State s => Player|undefined) SCR_CURRENT_PLAYER, // Return the current player of the state (undefined = random)
  (State s, Move m => Bool) SCR_IS_LEGAL, // Return whether the move is legal
  (@State s, Move m => -) SCR_APPLY_MOVE, // Apply the move to the given state, without checking legality
  (State s => PlayoutResult) SCR_PLAYOUT_RESULT, // Return playout result (can be tentative or final)
]
*/
enum RULESET {
  SCR_DECODE,
  SCR_ENCODE,
  SCR_CLEANUP,
  SCR_IS_FINAL,
  SCR_GENERATE_MOVES,
  SCR_GENERATE_RAND,
  SCR_CURRENT_PLAYER,
  SCR_IS_LEGAL,
  SCR_APPLY_MOVE,
  SCR_PLAYOUT_RESULT,
}
{
  var _ruleset = array_create(10);
  _ruleset[0] = argument0;
  _ruleset[1] = argument1;
  _ruleset[2] = argument2;
  _ruleset[3] = argument3;
  _ruleset[4] = argument4;
  _ruleset[5] = argument5;
  _ruleset[6] = argument6;
  _ruleset[7] = argument7;
  _ruleset[8] = argument8;
  _ruleset[9] = argument9;
  return _ruleset;
}
