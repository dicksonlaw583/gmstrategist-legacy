///intransitivedice_test_playout_result()
var fixture, got, expected;

// Unfinished
expected = IntransitiveDiceResult(false);
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
got = intransitivedice_playout_result(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid result on p0pick!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
got = intransitivedice_playout_result(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid result on p1pick!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p0roll", 0, 1, undefined, undefined);
got = intransitivedice_playout_result(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid result on p0roll!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1roll", 0, 1, 4, undefined);
got = intransitivedice_playout_result(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid result on p1roll!");
ds_map_destroy(fixture);

// Player 0 win
fixture = IntransitiveDiceState("done", 0, 1, 9, 6);
expected = IntransitiveDiceResult(true, 9, 6);
got = intransitivedice_playout_result(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid result on player 0 win!");
ds_map_destroy(fixture);

// Player 1 win
fixture = IntransitiveDiceState("done", 0, 1, 4, 8);
expected = IntransitiveDiceResult(true, 4, 8);
got = intransitivedice_playout_result(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid result on player 1 win!");
ds_map_destroy(fixture);

