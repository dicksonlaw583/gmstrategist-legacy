///tictactoe_test_new_game()
var fixture;
repeat (10) {
  fixture = tictactoe_new_game();
  for (var i = 0; i < 9; i++) {
    assert_equal(fixture[i], -1, "Tic-tac-toe new game returned weird board!");
  }
  assert(fixture[9] == 0 || fixture[9] == 1, "Tic-tac-toe new game returned invalid player!");
}

