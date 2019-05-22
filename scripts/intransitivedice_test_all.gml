///intransitivedice_test_all()

// Start tests
var time_a, time_b;
time_a = current_time;

// Run tests
intransitivedice_test_constructor();
intransitivedice_test_generate_moves();
intransitivedice_test_generate_random();
intransitivedice_test_current_player();
intransitivedice_test_is_final();
intransitivedice_test_is_legal();
intransitivedice_test_apply_move();
intransitivedice_test_playout_result();
intransitivedice_test_interpret_result_mcts();

// End tests
time_b = current_time;

// Show message
var msg = "Intransitive dice unit tests finished in " + string(time_b-time_a) + "ms.";
if (os_browser == browser_not_a_browser) {
  show_debug_message(msg);
} else {
  show_message(msg);
}

