///intransitivedice_test_constructor()
var got, expected;

// IntransitiveDiceState
got = IntransitiveDiceState("p0pick", 0, 2, 4, 5);
assert_equal(got[? "phase"], "p0pick", "Intransitive dice state constructor failed!");
assert_equal(got[? "p0pick"], 0, "Intransitive dice state constructor failed!");
assert_equal(got[? "p1pick"], 2, "Intransitive dice state constructor failed!");
assert_equal(got[? "p0roll"], 4, "Intransitive dice state constructor failed!");
assert_equal(got[? "p1roll"], 5, "Intransitive dice state constructor failed!");
ds_map_destroy(got);

// IntransitiveDiceResult
got = IntransitiveDiceResult(false);
expected = GmstArray(false, 0.5, undefined, undefined);
assert_equalish(got, expected, "Intransitive dice result failed on unfinished!");
got = IntransitiveDiceResult(true, 5, 4);
expected = GmstArray(true, 0, 5, 4);
assert_equalish(got, expected, "Intransitive dice result failed on player 0 win!");
got = IntransitiveDiceResult(true, 4, 5);
expected = GmstArray(true, 1, 4, 5);
assert_equalish(got, expected, "Intransitive dice result failed on player 1 win!");
got = undefined;
expected = undefined;
