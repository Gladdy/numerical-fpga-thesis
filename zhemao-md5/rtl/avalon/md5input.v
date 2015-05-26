module md5input (
    input clk,
    input reset,

    input        avs_write,
    input [31:0] avs_writedata,
    input [8:0]  avs_address,

    output        md5_write,
    output [31:0] md5_writedata,
    output [8:0]  md5_writeaddr
);

assign md5_write = avs_write;
assign md5_writedata = avs_writedata;
assign md5_writeaddr = avs_address;

endmodule
