///intransitivedice_test_apply_move()
var fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);

// p0pick
intransitivedice_apply_move(fixture, 1);
assert_equal(fixture[? "p0pick"], 1, "Intransitive dice failed to apply move on p0pick!");
assert_equal(fixture[? "phase"], "p1pick", "Intransitive dice failed to change phase on p0pick!");

// p1pick
intransitivedice_apply_move(fixture, 2);
assert_equal(fixture[? "p1pick"], 2, "Intransitive dice failed to apply move on p1pick!");
assert_equal(fixture[? "phase"], "p0roll", "Intransitive dice failed to change phase on p1pick!");

// p0roll
intransitivedice_apply_move(fixture, 6);
assert_equal(fixture[? "p0roll"], 6, "Intransitive dice failed to apply move on p0roll!");
assert_equal(fixture[? "phase"], "p1roll", "Intransitive dice failed to change phase on p0roll!");

// p1roll
intransitivedice_apply_move(fixture, 5);
assert_equal(fixture[? "p1roll"], 5, "Intransitive dice failed to apply move on p1roll!");
assert_equal(fixture[? "phase"], "done", "Intransitive dice failed to change phase on p1roll!");

// Cleanup
ds_map_destroy(fixture);

