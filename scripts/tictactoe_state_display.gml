///tictactoe_state_display(state)
var nl = chr(10),
    sym = GmstArray(" ", "O", "X");
var s = argument0;
var disp = "   A  B  C ";
for (var i = 0; i < 9; i += 3) {
  disp += nl + string((i div 3) + 1) + " [" + sym[s[i]+1] + "][" + sym[s[i+1]+1] + "][" + sym[s[i+2]+1] + "]";
}
return disp;

