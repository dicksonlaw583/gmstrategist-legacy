///intransitivedice_test_is_legal()
var fixture;

// p0pick should allow 0, 1, 2
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
assert_fail(intransitivedice_is_legal(fixture, 3), "Intransitive dice allowed invalid pick on p0pick!");
assert(intransitivedice_is_legal(fixture, 0), "Intransitive dice disallowed die 0 on p0pick!");
assert(intransitivedice_is_legal(fixture, 1), "Intransitive dice disallowed die 1 on p0pick!");
assert(intransitivedice_is_legal(fixture, 2), "Intransitive dice disallowed die 2 on p0pick!");

// p1pick should allow what player 0 didn't pick
fixture[? "phase"] = "p1pick";
fixture[? "p0pick"] = 0;
assert_fail(intransitivedice_is_legal(fixture, 3), "Intransitive dice allowed invalid pick on p1pick!");
assert_fail(intransitivedice_is_legal(fixture, 0), "Intransitive dice allowed chosen die on p1pick!");
assert(intransitivedice_is_legal(fixture, 1), "Intransitive dice disallowed die 1 on p1pick!");
assert(intransitivedice_is_legal(fixture, 2), "Intransitive dice disallowed die 2 on p1pick!");

// p0roll should allow the appropriate rolls
fixture[? "phase"] = "p0roll";
fixture[? "p1pick"] = 1;
assert(intransitivedice_is_legal(fixture, 2), "Intransitive dice disallowed 2 on die 0!");
assert(intransitivedice_is_legal(fixture, 4), "Intransitive dice disallowed 4 on die 0!");
assert(intransitivedice_is_legal(fixture, 9), "Intransitive dice disallowed 9 on die 0!");
fixture[? "p0pick"] = 2;
assert(intransitivedice_is_legal(fixture, 3), "Intransitive dice disallowed 3 on die 2!");
assert(intransitivedice_is_legal(fixture, 5), "Intransitive dice disallowed 5 on die 2!");
assert(intransitivedice_is_legal(fixture, 7), "Intransitive dice disallowed 7 on die 2!");
fixture[? "p0pick"] = 1;

// p1roll should allow the appropriate rolls
fixture[? "phase"] = "p1roll";
assert(intransitivedice_is_legal(fixture, 1), "Intransitive dice disallowed 1 on die 1!");
assert(intransitivedice_is_legal(fixture, 6), "Intransitive dice disallowed 6 on die 1!");
assert(intransitivedice_is_legal(fixture, 8), "Intransitive dice disallowed 8 on die 1!");

// Cleanup
ds_map_destroy(fixture);

