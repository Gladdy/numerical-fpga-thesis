
module soc_system (
	clk_clk,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	md5_control_start,
	md5_control_reset,
	md5_control_done,
	md5_output_readdata,
	md5_output_readaddr,
	md5_input_data,
	md5_input_addr);	

	input		clk_clk;
	output	[12:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[7:0]	memory_mem_dq;
	inout		memory_mem_dqs;
	inout		memory_mem_dqs_n;
	output		memory_mem_odt;
	output		memory_mem_dm;
	input		memory_oct_rzqin;
	output	[31:0]	md5_control_start;
	output	[31:0]	md5_control_reset;
	input	[31:0]	md5_control_done;
	input	[31:0]	md5_output_readdata;
	output	[6:0]	md5_output_readaddr;
	output	[31:0]	md5_input_data;
	output	[8:0]	md5_input_addr;
endmodule
