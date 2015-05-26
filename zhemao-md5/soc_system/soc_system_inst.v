	soc_system u0 (
		.clk_clk             (<connected-to-clk_clk>),             //         clk.clk
		.memory_mem_a        (<connected-to-memory_mem_a>),        //      memory.mem_a
		.memory_mem_ba       (<connected-to-memory_mem_ba>),       //            .mem_ba
		.memory_mem_ck       (<connected-to-memory_mem_ck>),       //            .mem_ck
		.memory_mem_ck_n     (<connected-to-memory_mem_ck_n>),     //            .mem_ck_n
		.memory_mem_cke      (<connected-to-memory_mem_cke>),      //            .mem_cke
		.memory_mem_cs_n     (<connected-to-memory_mem_cs_n>),     //            .mem_cs_n
		.memory_mem_ras_n    (<connected-to-memory_mem_ras_n>),    //            .mem_ras_n
		.memory_mem_cas_n    (<connected-to-memory_mem_cas_n>),    //            .mem_cas_n
		.memory_mem_we_n     (<connected-to-memory_mem_we_n>),     //            .mem_we_n
		.memory_mem_reset_n  (<connected-to-memory_mem_reset_n>),  //            .mem_reset_n
		.memory_mem_dq       (<connected-to-memory_mem_dq>),       //            .mem_dq
		.memory_mem_dqs      (<connected-to-memory_mem_dqs>),      //            .mem_dqs
		.memory_mem_dqs_n    (<connected-to-memory_mem_dqs_n>),    //            .mem_dqs_n
		.memory_mem_odt      (<connected-to-memory_mem_odt>),      //            .mem_odt
		.memory_mem_dm       (<connected-to-memory_mem_dm>),       //            .mem_dm
		.memory_oct_rzqin    (<connected-to-memory_oct_rzqin>),    //            .oct_rzqin
		.md5_control_start   (<connected-to-md5_control_start>),   // md5_control.start
		.md5_control_reset   (<connected-to-md5_control_reset>),   //            .reset
		.md5_control_done    (<connected-to-md5_control_done>),    //            .done
		.md5_output_readdata (<connected-to-md5_output_readdata>), //  md5_output.readdata
		.md5_output_readaddr (<connected-to-md5_output_readaddr>), //            .readaddr
		.md5_input_data      (<connected-to-md5_input_data>),      //   md5_input.data
		.md5_input_addr      (<connected-to-md5_input_addr>)       //            .addr
	);

