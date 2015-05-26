module md5output (
    input clk,
    input reset,

    input         avs_read,
    output [31:0] avs_readdata,
    input  [6:0]  avs_address,

    input  [31:0] md5_readdata,
    output [6:0]  md5_readaddr
);

assign avs_readdata = md5_readdata;
assign md5_readaddr = avs_address;

endmodule
