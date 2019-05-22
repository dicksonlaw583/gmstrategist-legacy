///intransitivedice_test_interpret_result_mcts()
var fixture, got;

// Unfinished
fixture = IntransitiveDiceResult(false);
got = intransitivedice_interpret_result_mcts("state", fixture, 0, undefined);
assert_equalish(got, 0.5, "Intransitive dice misinterprets unfinished result on MCTS!");
got = intransitivedice_interpret_result_mcts("state", fixture, 1, undefined);
assert_equalish(got, 0.5, "Intransitive dice misinterprets unfinished result on MCTS!");

// Player 0 win
fixture = IntransitiveDiceResult(true, 9, 6);
got = intransitivedice_interpret_result_mcts("state", fixture, 0, undefined);
assert_equalish(got, 1, "Intransitive dice misinterprets player 0 win for player 0 on MCTS!");
got = intransitivedice_interpret_result_mcts("state", fixture, 1, undefined);
assert_equalish(got, 0, "Intransitive dice misinterprets player 0 win for player 1 on MCTS!");

// Player 1 win
fixture = IntransitiveDiceResult(true, 4, 8);
got = intransitivedice_interpret_result_mcts("state", fixture, 0, undefined);
assert_equalish(got, 0, "Intransitive dice misinterprets player 1 win for player 0 on MCTS!");
got = intransitivedice_interpret_result_mcts("state", fixture, 1, undefined);
assert_equalish(got, 1, "Intransitive dice misinterprets player 1 win for player 1 on MCTS!");

