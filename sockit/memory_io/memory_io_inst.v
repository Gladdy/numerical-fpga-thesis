	memory_io u0 (
		.clk_clk                (<connected-to-clk_clk>),                //          clk.clk
		.data_control_writedata (<connected-to-data_control_writedata>), // data_control.writedata
		.data_control_readdata  (<connected-to-data_control_readdata>),  //             .readdata
		.data_control_address   (<connected-to-data_control_address>),   //             .address
		.data_control_read      (<connected-to-data_control_read>),      //             .read
		.data_control_write     (<connected-to-data_control_write>),     //             .write
		.data_in_write          (<connected-to-data_in_write>),          //      data_in.write
		.data_in_writedata      (<connected-to-data_in_writedata>),      //             .writedata
		.data_in_address        (<connected-to-data_in_address>),        //             .address
		.data_out_readdata      (<connected-to-data_out_readdata>),      //     data_out.readdata
		.data_out_address       (<connected-to-data_out_address>),       //             .address
		.memory_mem_a           (<connected-to-memory_mem_a>),           //       memory.mem_a
		.memory_mem_ba          (<connected-to-memory_mem_ba>),          //             .mem_ba
		.memory_mem_ck          (<connected-to-memory_mem_ck>),          //             .mem_ck
		.memory_mem_ck_n        (<connected-to-memory_mem_ck_n>),        //             .mem_ck_n
		.memory_mem_cke         (<connected-to-memory_mem_cke>),         //             .mem_cke
		.memory_mem_cs_n        (<connected-to-memory_mem_cs_n>),        //             .mem_cs_n
		.memory_mem_ras_n       (<connected-to-memory_mem_ras_n>),       //             .mem_ras_n
		.memory_mem_cas_n       (<connected-to-memory_mem_cas_n>),       //             .mem_cas_n
		.memory_mem_we_n        (<connected-to-memory_mem_we_n>),        //             .mem_we_n
		.memory_mem_reset_n     (<connected-to-memory_mem_reset_n>),     //             .mem_reset_n
		.memory_mem_dq          (<connected-to-memory_mem_dq>),          //             .mem_dq
		.memory_mem_dqs         (<connected-to-memory_mem_dqs>),         //             .mem_dqs
		.memory_mem_dqs_n       (<connected-to-memory_mem_dqs_n>),       //             .mem_dqs_n
		.memory_mem_odt         (<connected-to-memory_mem_odt>),         //             .mem_odt
		.memory_mem_dm          (<connected-to-memory_mem_dm>),          //             .mem_dm
		.memory_oct_rzqin       (<connected-to-memory_oct_rzqin>),       //             .oct_rzqin
		.reset_reset_n          (<connected-to-reset_reset_n>)           //        reset.reset_n
	);

