///gmst_utest_all()

// Start tests
var time_a, time_b;
time_a = current_time;

// Run tests
gmst_utest_sanity();
gmst_utest_utilities();
gmst_utest_constructors();

// End tests
time_b = current_time;

// Show message
var msg = "GMStrategist unit tests finished in " + string(time_b-time_a) + "ms.";
if (os_browser == browser_not_a_browser) {
  show_debug_message(msg);
} else {
  show_message(msg);
}

