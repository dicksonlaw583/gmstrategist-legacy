///gmst_itest_all()

// Synchronous tests
var time_a, time_b;
time_a = current_time;

// Run synchronous tests
gmst_itest_mcts();
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
with (instance_create(0, 0, obj_gmst_test_daemon)) {
  ___test___[0] = gmst_itest_sanity;
  script_execute(___test___[0], TEST_PHASE.SETUP);
}

