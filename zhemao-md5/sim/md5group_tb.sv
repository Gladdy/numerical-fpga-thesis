module md5group_tb ();

parameter unit_address = 5'd30;

reg [31:0] testsequence [0:15];
reg [31:0] expected_arr [3:0];

reg [3:0] writeaddr;
wire [31:0] writedata = testsequence[writeaddr];
reg [1:0] readaddr;
wire [31:0] readdata;
wire [31:0] expected = expected_arr[readaddr];

reg write;
reg clk = 1'b1;
reg [31:0] reset;
reg [31:0] start;
wire [127:0] digest0;
wire [127:0] digest1;
wire [31:0] done;

md5group md5 (
    .clk (clk),
    .reset (reset),
    .start (start),
    .write (write),
    .writedata (writedata),
    .writeaddr ({unit_address, writeaddr}),
    .readaddr  ({unit_address, readaddr}),
    .readdata (readdata),
    .done (done)
);

always begin
    #10000 clk = !clk;
end

integer i;
initial begin
    expected_arr[0] = 32'h2ad26682;
    expected_arr[1] = 32'h14ba892c;
    expected_arr[2] = 32'h61d3eb27;
    expected_arr[3] = 32'hbaebddf8;

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

    reset[unit_address] = 1'b1;
    write = 1'b0;
    start[unit_address] = 1'b0;
    writeaddr = 4'h0;
    #20000 reset[unit_address] = 1'b0;
    write = 1'b1;

    for (i = 1; i < 16; i = i + 1) begin
        #20000 writeaddr = i[3:0];
    end

    #20000 write = 1'b0;
    start[unit_address] = 1'b1;
    #20000 start[unit_address] = 1'b0;

    #5200000 assert(done[unit_address] == 1'b1);

    for (i = 0; i < 4; i = i + 1) begin
        readaddr = i[1:0];
        #20000 assert(expected == readdata);
    end
end

endmodule
