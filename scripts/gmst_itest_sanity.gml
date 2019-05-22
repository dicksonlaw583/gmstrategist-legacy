///gmst_itest_sanity(phase)
switch (argument0) {
  case TEST_PHASE.SETUP:
    ___current_test_name___ = "Async integration tester sanity";
    testvar = 583;
    return true;
    break;
  case TEST_PHASE.RUNNING:
    assert_equal(testvar, 583, "Integration sanity test failed!");
    return true;
    break;
  case TEST_PHASE.CLEANUP:
    return true;
    break;
}
return false;

