module delay_ctrl (
    input clk,
    input reset,

    input faster,
    input slower,
    output [3:0] delay,

    input write,
    input [7:0] writedata
);

reg [3:0] delay_intern = 4'b1000;

assign delay = delay_intern;

always @(posedge clk) begin
    if (reset)
        delay_intern <= 4'b1000;
    else if (write)
        delay_intern <= writedata[3:0];
    else if (faster && delay_intern != 4'b0001)
        delay_intern <= delay_intern - 1'b1;
    else if (slower && delay_intern != 4'b1111)
        delay_intern <= delay_intern + 1'b1;
end

endmodule
