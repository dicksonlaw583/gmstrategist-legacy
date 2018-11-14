///TextGameset(scr_new_game, scr_agency, scr_player_name, scr_state_display, scr_move_output, scr_move_input, scr_playout_comment)
/**
TextGameset[
  (- => State) SCR_NEW_GAME, // Return a new game state
  (Player p => -2|-1|(State => Move)) SCR_AGENCY, // Return what plays as the given player (-2 = tree, -1 = player, any other for script)
  (Player p => String) SCR_PLAYER_NAME, // Return the name of the player
  (State s => String) SCR_STATE_DISPLAY, // Return a string representation of the game state
  (Move m => String) SCR_MOVE_OUTPUT, // Return the string equivalent of the given move
  (String s => Move|undefined) SCR_MOVE_INPUT, // Return the move equivalent of the given string (undefined if not valid)
  (PlayoutResult pr => String) SCR_PLAYOUT_COMMENT // Return a comment for the playout result
]
*/
enum TEXT_GAMESET {
  SCR_NEW_GAME,
  SCR_AGENCY,
  SCR_PLAYER_NAME,
  SCR_STATE_DISPLAY,
  SCR_MOVE_OUTPUT,
  SCR_MOVE_INPUT,
  SCR_PLAYOUT_COMMENT
}
enum TEXT_GAMESET_AGENCY {
  MAIN_TREE = -2,
  USER_INPUT = -1
}
{
  var _text_gameset = array_create(7);
  _text_gameset[0] = argument0;
  _text_gameset[1] = argument1;
  _text_gameset[2] = argument2;
  _text_gameset[3] = argument3;
  _text_gameset[4] = argument4;
  _text_gameset[5] = argument5;
  _text_gameset[6] = argument6;
  return _text_gameset;
}
