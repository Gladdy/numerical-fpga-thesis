module md5unit_tb ();

reg [31:0] testsequence [0:15];
parameter expected = 128'hbaebddf861d3eb2714ba892c2ad26682;

reg [3:0] writeaddr;
wire [31:0] writedata = testsequence[writeaddr];
reg write;
reg clk = 1'b1;
reg reset;
reg start;
wire [127:0] digest0;
wire [127:0] digest1;
wire done1;
wire done0;

md5unit md5 (
    .clk (clk),
    .reset ({1'b0, reset}),
    .start ({1'b0, start}),
    .write (write),
    .writedata (writedata),
    .writeaddr ({1'b0, writeaddr}),
    .digest0 (digest0),
    .digest1 (digest1),
    .done ({done1, done0})
);

always begin
    #10000 clk = !clk;
end

integer i;
initial begin
    testsequence[0] = 32'h01680208;
    testsequence[1] = 32'h13ab80bb;
    testsequence[2] = 32'hcb8b2c30;
    testsequence[3] = 32'hb9657582;
    testsequence[4] = 32'ha3793c48;
    testsequence[5] = 32'h103f26be;
    testsequence[6] = 32'h0b78dac4;
    testsequence[7] = 32'h5c433348;
    testsequence[8] = 32'h4de99287;
    testsequence[9] = 32'heff0be7c;
    testsequence[10] = 32'h00808533;
    testsequence[11] = 32'h00000000;
    testsequence[12] = 32'h00000000;
    testsequence[13] = 32'h00000000;
    testsequence[14] = 32'h00000150;
    testsequence[15] = 32'h00000000;

    reset = 1'b1;
    write = 1'b0;
    start = 1'b0;
    writeaddr = 4'h0;
    #20000 reset = 1'b0;
    write = 1'b1;

    for (i = 1; i < 16; i = i + 1) begin
        #20000 writeaddr = i[3:0];
    end

    #20000 write = 1'b0;
    start = 1'b1;
    #20000 start = 1'b0;

    #5200000 assert(done0 == 1'b1);
    assert(digest0 == expected);
end

endmodule
