///gmst_itest_all()
with (instance_create(0, 0, obj_gmst_test_daemon)) {
  ___test___[0] = gmst_itest_sanity;
  script_execute(___test___[0], TEST_PHASE.SETUP);
}

