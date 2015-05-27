module md5group (
    input clk,
    input [31:0] start,
    input [31:0] reset,

    input write,
    input [31:0] writedata,
    input [8:0]  writeaddr,

    output reg [31:0] readdata,
    input      [6:0]  readaddr,

    output [31:0] done
);

wire [15:0] unit_write;
wire [127:0] digest_arr [0:31];
wire [4:0] digest_sel = readaddr[6:2];
wire [1:0] word_sel = readaddr[1:0];
wire [127:0] digest = digest_arr[digest_sel];

always @(*) begin
    case (word_sel)
        2'b00: readdata = digest[31:0];
        2'b01: readdata = digest[63:32];
        2'b10: readdata = digest[95:64];
        2'b11: readdata = digest[127:96];
    endcase
end

genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : MD5GEN
        assign unit_write[i] = (write && i == writeaddr[8:5]);
        md5unit md5 (
            .clk (clk),
            .reset (reset[2 * i + 1 : 2 * i]),
            .start (start[2 * i + 1 : 2 * i]),
            .write (unit_write[i]),
            .writedata (writedata),
            .writeaddr (writeaddr[4:0]),
            .digest0 (digest_arr[2 * i]),
            .digest1 (digest_arr[2 * i + 1]),
            .done (done[2 * i + 1 : 2 * i])
        );
    end
endgenerate

endmodule
