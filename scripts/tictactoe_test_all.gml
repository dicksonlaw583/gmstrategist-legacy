///tictactoe_test_all()

// Start tests
var time_a, time_b;
time_a = current_time;

// Run tests
tictactoe_test_constructor();
tictactoe_test_generate_moves();
tictactoe_test_current_player();
tictactoe_test_is_final();
tictactoe_test_is_legal();
tictactoe_test_apply_move();
tictactoe_test_playout_result();
tictactoe_test_interpret_result();

// End tests
time_b = current_time;

// Show message
var msg = "Tic-Tac-Toe unit tests finished in " + string(time_b-time_a) + "ms.";
if (os_browser == browser_not_a_browser) {
  show_debug_message(msg);
} else {
  show_message(msg);
}

