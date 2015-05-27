module md5cracker (
    input clock_50,
    output [3:0] leds,

    output [14:0] hps_memory_mem_a,
    output [2:0]  hps_memory_mem_ba,
    output        hps_memory_mem_ck,
    output        hps_memory_mem_ck_n,
    output        hps_memory_mem_cke,
    output        hps_memory_mem_cs_n,
    output        hps_memory_mem_ras_n,
    output        hps_memory_mem_cas_n,
    output        hps_memory_mem_we_n,
    output        hps_memory_mem_reset_n,
    inout  [39:0] hps_memory_mem_dq,
    inout  [4:0]  hps_memory_mem_dqs,
    inout  [4:0]  hps_memory_mem_dqs_n,
    output        hps_memory_mem_odt,
    output [4:0]  hps_memory_mem_dm,
    input         hps_memory_oct_rzqin
);

wire [31:0] md5_readdata;
wire [31:0] md5_writedata;
wire [6:0]  md5_readaddr;
wire [8:0]  md5_writeaddr;
wire [31:0] md5_start;
wire [31:0] md5_reset;
wire [31:0] md5_done;
wire        md5_write;

md5group md5 (
    .clk (clock_50),
    .reset (md5_reset),
    .start (md5_start),

    .write (md5_write),
    .writedata (md5_writedata),
    .writeaddr (md5_writeaddr),
    
    .readaddr (md5_readaddr),
    .readdata (md5_readdata),

    .done (md5_done)
);

soc_system soc (
    .clk_clk (clock_50),

    .memory_mem_a        (hps_memory_mem_a),
    .memory_mem_ba       (hps_memory_mem_ba),
    .memory_mem_ck       (hps_memory_mem_ck),
    .memory_mem_ck_n     (hps_memory_mem_ck_n),
    .memory_mem_cke      (hps_memory_mem_cke),
    .memory_mem_cs_n     (hps_memory_mem_cs_n),
    .memory_mem_ras_n    (hps_memory_mem_ras_n),
    .memory_mem_cas_n    (hps_memory_mem_cas_n),
    .memory_mem_we_n     (hps_memory_mem_we_n),
    .memory_mem_reset_n  (hps_memory_mem_reset_n),
    .memory_mem_dq       (hps_memory_mem_dq),
    .memory_mem_dqs      (hps_memory_mem_dqs),
    .memory_mem_dqs_n    (hps_memory_mem_dqs_n),
    .memory_mem_odt      (hps_memory_mem_odt),
    .memory_mem_dm       (hps_memory_mem_dm),
    .memory_oct_rzqin    (hps_memory_oct_rzqin),

    .md5_output_readdata (md5_readdata),
    .md5_output_readaddr (md5_readaddr),
    .md5_control_start   (md5_start),
    .md5_control_reset   (md5_reset),
    .md5_control_done    (md5_done),
    .md5_input_writedata      (md5_writedata),
    .md5_input_writeaddr      (md5_writeaddr),
    .md5_input_write     (md5_write)
);

endmodule
