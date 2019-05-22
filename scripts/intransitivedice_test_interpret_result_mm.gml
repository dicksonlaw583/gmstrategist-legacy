///intransitivedice_test_interpret_result_mm()
var fixture, got;

// Unfinished
fixture = IntransitiveDiceResult(false);
got = intransitivedice_interpret_result_mm(fixture, "state", undefined);
assert_equalish(got, 0.5, "Intransitive dice misinterprets unfinished result on Minimax!");

// Player 0 win
fixture = IntransitiveDiceResult(true, 9, 6);
got = intransitivedice_interpret_result_mm(fixture, "state", undefined);
assert_equalish(got, 0, "Intransitive dice misinterprets player 0 win on Minimax!");

// Player 1 win
fixture = IntransitiveDiceResult(true, 4, 8);
got = intransitivedice_interpret_result_mm(fixture, "state", undefined);
assert_equalish(got, 1, "Intransitive dice misinterprets player 1 win on Minimax!");

