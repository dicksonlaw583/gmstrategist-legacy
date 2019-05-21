///tictactoe_test_playout_comment()
var result;

// X player win
result = TicTacToeResult(1, true, 1, 4, 7);
assert_equal(tictactoe_playout_comment(result), "AI wins!", "Tic-tac-toe playout comment wrong!");

// O player win
result = TicTacToeResult(0, true, 2, 4, 6);
assert_equal(tictactoe_playout_comment(result), "Player wins!", "Tic-tac-toe playout comment wrong!");

// Draw
result = TicTacToeResult(0.5, true, undefined, undefined, undefined);
assert_equal(tictactoe_playout_comment(result), "Draw!", "Tic-tac-toe playout comment wrong!");

// Mid-game
result = TicTacToeResult(0.5, false, undefined, undefined, undefined);
assert_equal(tictactoe_playout_comment(result), "Unfinished game!", "Tic-tac-toe playout comment wrong!");

