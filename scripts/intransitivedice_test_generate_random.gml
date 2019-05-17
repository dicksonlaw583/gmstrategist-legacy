///intransitivedice_test_generate_random()
var fixture, got, expected;

// p0roll rolls for player 0
// Die 0
fixture = IntransitiveDiceState("p0roll", 0, 2, undefined, undefined);
expected = GmstArray(2, 4, 9);
repeat (20) {
  got = intransitivedice_generate_random(fixture);
  assert_contains(expected, got, "Intransitive dice gave player 0 an unexpected roll on die 0!");
}
// Die 1
fixture[? "p0pick"] = 1;
expected = GmstArray(1, 6, 8);
repeat (20) {
  got = intransitivedice_generate_random(fixture);
  assert_contains(expected, got, "Intransitive dice gave player 0 an unexpected roll on die 1!");
}
// Die 2
fixture[? "p0pick"] = 2;
fixture[? "p1pick"] = 1;
expected = GmstArray(3, 5, 7);
repeat (20) {
  got = intransitivedice_generate_random(fixture);
  assert_contains(expected, got, "Intransitive dice gave player 0 an unexpected roll on die 2!");
}
// Cleanup
ds_map_destroy(fixture);

// p1roll rolls for player 1
// Die 0
fixture = IntransitiveDiceState("p1roll", 2, 0, 3, undefined);
got = intransitivedice_generate_random(fixture);
expected = GmstArray(2, 4, 9);
assert_contains(expected, got, "Intransitive dice gave player 1 an unexpected roll on die 0!");
// Die 1
fixture[? "p1pick"] = 1;
got = intransitivedice_generate_random(fixture);
expected = GmstArray(1, 6, 8);
assert_contains(expected, got, "Intransitive dice gave player 1 an unexpected roll on die 1!");
// Die 2
fixture[? "p0pick"] = 1;
fixture[? "p1pick"] = 2;
got = intransitivedice_generate_random(fixture);
expected = GmstArray(3, 5, 7);
assert_contains(expected, got, "Intransitive dice gave player 1 an unexpected roll on die 2!");
// Cleanup
ds_map_destroy(fixture);

