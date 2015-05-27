module md5unit (
    input clk,
    input [1:0] reset,
    input [1:0] start,

    input write,
    input [31:0] writedata,
    input [4:0]  writeaddr,

    output [127:0] digest0,
    output [127:0] digest1,

    output [1:0] done
);

wire [1:0] m_write;
assign m_write[0] = write && !writeaddr[4];
assign m_write[1] = write && writeaddr[4];

wire [5:0] cc_iaddr [1:0];
wire [3:0] cc_gaddr [1:0];

wire [127:0] cc_digest [1:0];
assign digest0 = cc_digest[0];
assign digest1 = cc_digest[1];

wire [31:0] cc_mdata [1:0];
wire [4:0]  cc_sdata [1:0];
wire [31:0] cc_kdata [1:0];

genvar i;
generate
    for (i = 0; i < 2; i = i + 1) begin : mccgen
        chunk_cruncher cc (
            .clk (clk),
            .reset (reset[i]),
            .start (start[i]),
            .done (done[i]),
            .digest (cc_digest[i]),
            .iaddr (cc_iaddr[i]),
            .kdata (cc_kdata[i]),
            .sdata (cc_sdata[i]),
            .gaddr (cc_gaddr[i]),
            .mdata (cc_mdata[i])
        );

        mdataram mram (
            .clock (clk),
            .data (writedata),
            .wraddress (writeaddr[3:0]),
            .wren (m_write[i]),
            .rdaddress (cc_gaddr[i]),
            .q (cc_mdata[i])
        );
    end
endgenerate

sdatarom srom (
    .clock (clk),
    .address_a (cc_iaddr[0]),
    .address_b (cc_iaddr[1]),
    .q_a (cc_sdata[0]),
    .q_b (cc_sdata[1])
);

kdatarom krom (
    .clock (clk),
    .address_a (cc_iaddr[0]),
    .address_b (cc_iaddr[1]),
    .q_a (cc_kdata[0]),
    .q_b (cc_kdata[1])
);

endmodule
