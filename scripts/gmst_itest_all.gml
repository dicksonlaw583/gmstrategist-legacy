///gmst_itest_all()

// Synchronous tests
var time_a, time_b;
time_a = current_time;

// Run synchronous tests
random_set_seed(0);
gmst_itest_mcts();
random_set_seed(0);
gmst_itest_mm();

// End synchronous tests
time_b = current_time;

// Show message
var msg = "GMStrategist synchronous integration tests finished in " + string(time_b-time_a) + "ms.";
if (os_browser == browser_not_a_browser) {
  show_debug_message(msg);
} else {
  show_message(msg);
}


// Asynchronous tests
random_set_seed(0);
with (instance_create(0, 0, obj_gmst_test_daemon)) {
  ___test___ = GmstArray(
    gmst_itest_sanity,
    gmst_itest_mcts_node_state_async,
    gmst_itest_emcts_node_state_async,
    gmst_itest_mm_node_state_async,
    gmst_itest_emm_node_state_async,
    gmst_itest_mcts_root_state_async,
    gmst_itest_emcts_root_state_async,
    gmst_itest_mm_root_state_async,
    gmst_itest_emm_root_state_async,
  );
  script_execute(___test___[0], TEST_PHASE.SETUP);
}

