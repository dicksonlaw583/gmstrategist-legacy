///intransitivedice_test_generate_moves()
var fixture, got, expected;

// Player 0 should get a choice of any die
fixture = IntransitiveDiceState("p0pick", undefined, undefined, undefined, undefined);
expected = GmstArray(0, 1, 2);
got = intransitivedice_generate_moves(fixture);
for (var i = 0; i < array_length_1d(expected); i++) {
  assert_contains(got, expected[i], "Intransitive dice didn't give player 0 full choice!");
}
ds_map_destroy(fixture);

// Don't let player 1 choose the same die as player 0
fixture = IntransitiveDiceState("p1pick", 1, undefined, undefined, undefined);
expected = GmstArray(0, 2);
got = intransitivedice_generate_moves(fixture);
for (var i = 0; i < array_length_1d(expected); i++) {
  assert_contains(got, expected[i], "Intransitive dice didn't give player 1 full choice!");
}
assert_doesnt_contain(got, 1, "Intransitive dice allowed player 1 to pick same die as player 0!");
ds_map_destroy(fixture);

