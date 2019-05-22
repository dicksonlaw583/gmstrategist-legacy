///intransitivedice_test_playout_comment()
var result;

// P1 win
result = IntransitiveDiceResult(true, 4, 8);
assert_equal(intransitivedice_playout_comment(result), "AI wins!", "Intransitive Dice playout comment wrong!");

// P0 win
result = IntransitiveDiceResult(true, 9, 6);
assert_equal(intransitivedice_playout_comment(result), "Player wins!", "Intransitive Dice playout comment wrong!");

// Mid-game
result = IntransitiveDiceResult(false);
assert_equal(intransitivedice_playout_comment(result), "Unfinished game!", "Intransitive Dice playout comment wrong!");

