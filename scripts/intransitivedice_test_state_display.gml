///intransitivedice_test_state_display()
var nl = chr(10);
var fixture, got, expected;

// p0pick
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
expected =
"Die A: 2, 2, 4, 4, 9, 9" + nl +
"Die B: 1, 1, 6, 6, 8, 8" + nl +
"Die C: 3, 3, 5, 5, 7, 7" + nl + nl +
"Your pick: ?"
;
got = intransitivedice_state_display(fixture);
assert_equal(got, expected, "Intransitive dice p0pick state display wrong!");
ds_map_destroy(fixture);

// p1pick
fixture = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
expected =
"Die A: 2, 2, 4, 4, 9, 9" + nl +
"Die B: 1, 1, 6, 6, 8, 8" + nl +
"Die C: 3, 3, 5, 5, 7, 7" + nl + nl +
"Your pick: A" + nl +
"AI's pick: ?"
;
got = intransitivedice_state_display(fixture);
assert_equal(got, expected, "Intransitive dice p1pick state display wrong!");
ds_map_destroy(fixture);

// p0roll
fixture = IntransitiveDiceState("p0roll", 0, 1, undefined, undefined);
expected =
"Die A: 2, 2, 4, 4, 9, 9" + nl +
"Die B: 1, 1, 6, 6, 8, 8" + nl +
"Die C: 3, 3, 5, 5, 7, 7" + nl + nl +
"Your pick: A" + nl +
"AI's pick: B" + nl + nl +
"Rolling!"
;
got = intransitivedice_state_display(fixture);
assert_equal(got, expected, "Intransitive dice p0roll state display wrong!");
ds_map_destroy(fixture);

// p1roll
fixture = IntransitiveDiceState("p1roll", 0, 1, 4, undefined);
expected =
"Die A: 2, 2, 4, 4, 9, 9" + nl +
"Die B: 1, 1, 6, 6, 8, 8" + nl +
"Die C: 3, 3, 5, 5, 7, 7" + nl + nl +
"Your pick: A" + nl +
"AI's pick: B" + nl + nl +
"Rolling!"
;
got = intransitivedice_state_display(fixture);
assert_equal(got, expected, "Intransitive dice p1roll state display wrong!");
ds_map_destroy(fixture);

// done
fixture = IntransitiveDiceState("done", 0, 1, 9, 6);
expected =
"Die A: 2, 2, 4, 4, 9, 9" + nl +
"Die B: 1, 1, 6, 6, 8, 8" + nl +
"Die C: 3, 3, 5, 5, 7, 7" + nl + nl +
"Your roll: 9" + nl +
"AI's roll: 6"
;
got = intransitivedice_state_display(fixture);
assert_equal(got, expected, "Intransitive dice done state display wrong!");
ds_map_destroy(fixture);

