
module memory_io (
	clk_clk,
	export_mem_io_export_control_data,
	export_mem_io_export_control_set,
	export_mem_io_export_input_data,
	export_mem_io_export_input_set,
	export_mem_io_export_output_data,
	export_mem_io_export_output_set,
	export_mem_io_export_output_waitrequest,
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
	reset_reset_n);	

	input		clk_clk;
	output	[31:0]	export_mem_io_export_control_data;
	output		export_mem_io_export_control_set;
	output	[127:0]	export_mem_io_export_input_data;
	output		export_mem_io_export_input_set;
	input	[127:0]	export_mem_io_export_output_data;
	input		export_mem_io_export_output_set;
	output		export_mem_io_export_output_waitrequest;
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
endmodule
