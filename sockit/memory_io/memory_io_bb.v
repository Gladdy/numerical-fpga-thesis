
module memory_io (
	clk_clk,
	data_control_writedata,
	data_control_readdata,
	data_control_address,
	data_control_read,
	data_control_write,
	data_in_write,
	data_in_writedata,
	data_in_address,
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
	reset_reset_n,
	data_out_readdata,
	data_out_address,
	data_out_read);	

	input		clk_clk;
	output	[31:0]	data_control_writedata;
	input	[31:0]	data_control_readdata;
	output	[7:0]	data_control_address;
	output		data_control_read;
	output		data_control_write;
	output		data_in_write;
	output	[31:0]	data_in_writedata;
	output	[7:0]	data_in_address;
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
	input		reset_reset_n;
	input	[31:0]	data_out_readdata;
	output	[7:0]	data_out_address;
	output		data_out_read;
endmodule
