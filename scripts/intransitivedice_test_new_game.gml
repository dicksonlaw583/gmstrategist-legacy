///intransitivedice_test_new_game()
var fixture;
repeat (10) {
  fixture = intransitivedice_new_game();
  assert_equal(fixture[? "phase"], "p0pick", "Intransitive dice new game returned weird state!");
  ds_map_destroy(fixture);
}

