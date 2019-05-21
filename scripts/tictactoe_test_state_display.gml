///tictactoe_test_state_display()
var nl = chr(10);
var fixture, got, expected;

// Test a board with X and O marks
fixture = TicTacToeState(
  1, 0, 1,
  0, 1, 0,
  0, 1, -1,
  1
);
expected =
"   A  B  C " + nl +
"1 [X][O][X]" + nl +
"2 [O][X][O]" + nl +
"3 [O][X][ ]";
got = tictactoe_state_display(fixture);
assert_equal(got, expected, "Tic-tac-toe state display wrong!");

