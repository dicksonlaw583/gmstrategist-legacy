///intransitivedice_test_heuristic()
var fixture, got, expected;

// Unfinished
expected = 0.5;
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
got = intransitivedice_heuristic(fixture);
assert_equalish(got, expected, "Intransitive dice gives invalid heuristic on p0pick!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
got = intransitivedice_heuristic(fixture);
assert_equalish(got, expected, "Intransitive dice gives invalid heuristic on p1pick!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p0roll", 0, 1, undefined, undefined);
got = intransitivedice_heuristic(fixture);
assert_equalish(got, expected, "Intransitive dice gives invalid heuristic on p0roll!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1roll", 0, 1, 4, undefined);
got = intransitivedice_heuristic(fixture);
assert_equalish(got, expected, "Intransitive dice gives invalid heuristic on p1roll!");
ds_map_destroy(fixture);

// Player 0 win
fixture = IntransitiveDiceState("done", 0, 1, 9, 6);
expected = 0
got = intransitivedice_heuristic(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid heuristic on player 0 win!");
ds_map_destroy(fixture);

// Player 1 win
fixture = IntransitiveDiceState("done", 0, 1, 4, 8);
expected = 1
got = intransitivedice_heuristic(fixture);
assert_equal(got, expected, "Intransitive dice gives invalid heuristic on player 1 win!");
ds_map_destroy(fixture);

