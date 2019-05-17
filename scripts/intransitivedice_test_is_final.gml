///intransitivedice_test_is_final()
var fixture;

// State is final on "done"
fixture = IntransitiveDiceState("done", 0, 2, 4, 3);
assert(intransitivedice_is_final(fixture), "Intransitive dice isn't final on done!");
ds_map_destroy(fixture);

// State is not final on any other phase
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
assert_fail(intransitivedice_is_final(fixture), "Intransitive dice is final on p0pick!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1pick", 0, undefined, undefined, undefined);
assert_fail(intransitivedice_is_final(fixture), "Intransitive dice is final on p1pick!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p0roll", 0, 1, undefined, undefined);
assert_fail(intransitivedice_is_final(fixture), "Intransitive dice is final on p0roll!");
ds_map_destroy(fixture);
fixture = IntransitiveDiceState("p1roll", 0, 1, 4, undefined);
assert_fail(intransitivedice_is_final(fixture), "Intransitive dice is final on p1roll!");
ds_map_destroy(fixture);

