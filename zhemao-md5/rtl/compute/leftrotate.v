module leftrotate (
    input  [31:0] rotin,
    input  [4:0]  rotby,
    output [31:0] rotout
);

wire [63:0] rotmid = ({rotin, rotin} << rotby);
assign rotout = rotmid[63:32];

endmodule
