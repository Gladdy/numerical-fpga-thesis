module sockit_test (
    input CLOCK_50,
    input [3:0] KEY,
    output [3:0] LED
);

wire [3:0] key_os;
wire [3:0] delay;
wire main_clk = CLOCK_50;

oneshot os (
    .clk (main_clk),
    .edge_sig (KEY),
    .level_sig (key_os)
);

delay_ctrl dc (
    .clk (main_clk),
    .faster (key_os[1]),
    .slower (key_os[0]),
    .delay (delay),
    .reset (key_os[3])
);

blinker b (
    .clk (main_clk),
    .delay (delay),
    .led (LED),
    .reset (key_os[3]),
    .pause (key_os[2])
);

endmodule