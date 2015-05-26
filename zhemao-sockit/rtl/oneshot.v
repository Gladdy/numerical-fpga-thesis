module oneshot (
    input clk,
    input [3:0] edge_sig,
    output [3:0] level_sig
);

reg [3:0] cur_value;
reg [3:0] last_value;

assign level_sig = ~cur_value & last_value;

always @(posedge clk) begin
    cur_value <= edge_sig;
    last_value <= cur_value;
end

endmodule
