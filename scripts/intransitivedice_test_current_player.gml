///intransitivedice_test_current_player()
var fixture, got, expected;

// Should be player 0 on phase p0pick
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
expected = 0;
got = intransitivedice_current_player(fixture);
assert_equal(got, expected, "Intransitive dice misidentified player 0!");
ds_map_destroy(fixture);

// Should be player 1 on phase p1pick
fixture = IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined);
expected = 1;
got = intransitivedice_current_player(fixture);
assert_equal(got, expected, "Intransitive dice misidentified player 1!");
ds_map_destroy(fixture);

// Should be the randomizer on phases p0roll and p1roll
fixture = IntransitiveDiceState("p0roll", 1, 2, 6, undefined);
expected = undefined;
got = intransitivedice_current_player(fixture);
assert_equal(got, expected, "Intransitive dice misidentified randomizer on p0roll!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1roll", 1, 2, 6, 3);
expected = undefined;
got = intransitivedice_current_player(fixture);
assert_equal(got, expected, "Intransitive dice misidentified randomizer on p1roll!");
ds_map_destroy(fixture);

