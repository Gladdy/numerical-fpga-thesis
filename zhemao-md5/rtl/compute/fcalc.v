module fcalc (
    input [1:0] sel,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    output reg [31:0] f
);

always @(*) begin
    case (sel)
        // 0 <= i <= 15
        2'b00: f <= (b & c) | (~b & d);
        // 16 <= i <= 31
        2'b01: f <= (d & b) | (~d & c);
        // 32 <= i <= 47
        2'b10: f <= b ^ c ^ d;
        // 48 <= i <= 63
        2'b11: f <= c ^ (b | ~d);
    endcase
end

endmodule
