	component memory_io is
		port (
			clk_clk                : in    std_logic                     := 'X';             -- clk
			data_control_writedata : out   std_logic_vector(31 downto 0);                    -- writedata
			data_control_readdata  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			data_control_address   : out   std_logic_vector(7 downto 0);                     -- address
			data_control_read      : out   std_logic;                                        -- read
			data_control_write     : out   std_logic;                                        -- write
			data_in_write          : out   std_logic;                                        -- write
			data_in_writedata      : out   std_logic_vector(31 downto 0);                    -- writedata
			data_in_address        : out   std_logic_vector(7 downto 0);                     -- address
			memory_mem_a           : out   std_logic_vector(12 downto 0);                    -- mem_a
			memory_mem_ba          : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck          : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n        : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke         : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n        : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n       : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n       : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n        : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n     : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq          : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
			memory_mem_dqs         : inout std_logic                     := 'X';             -- mem_dqs
			memory_mem_dqs_n       : inout std_logic                     := 'X';             -- mem_dqs_n
			memory_mem_odt         : out   std_logic;                                        -- mem_odt
			memory_mem_dm          : out   std_logic;                                        -- mem_dm
			memory_oct_rzqin       : in    std_logic                     := 'X';             -- oct_rzqin
			reset_reset_n          : in    std_logic                     := 'X';             -- reset_n
			data_out_readdata      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			data_out_address       : out   std_logic_vector(7 downto 0);                     -- address
			data_out_read          : out   std_logic                                         -- read
		);
	end component memory_io;

	u0 : component memory_io
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --          clk.clk
			data_control_writedata => CONNECTED_TO_data_control_writedata, -- data_control.writedata
			data_control_readdata  => CONNECTED_TO_data_control_readdata,  --             .readdata
			data_control_address   => CONNECTED_TO_data_control_address,   --             .address
			data_control_read      => CONNECTED_TO_data_control_read,      --             .read
			data_control_write     => CONNECTED_TO_data_control_write,     --             .write
			data_in_write          => CONNECTED_TO_data_in_write,          --      data_in.write
			data_in_writedata      => CONNECTED_TO_data_in_writedata,      --             .writedata
			data_in_address        => CONNECTED_TO_data_in_address,        --             .address
			memory_mem_a           => CONNECTED_TO_memory_mem_a,           --       memory.mem_a
			memory_mem_ba          => CONNECTED_TO_memory_mem_ba,          --             .mem_ba
			memory_mem_ck          => CONNECTED_TO_memory_mem_ck,          --             .mem_ck
			memory_mem_ck_n        => CONNECTED_TO_memory_mem_ck_n,        --             .mem_ck_n
			memory_mem_cke         => CONNECTED_TO_memory_mem_cke,         --             .mem_cke
			memory_mem_cs_n        => CONNECTED_TO_memory_mem_cs_n,        --             .mem_cs_n
			memory_mem_ras_n       => CONNECTED_TO_memory_mem_ras_n,       --             .mem_ras_n
			memory_mem_cas_n       => CONNECTED_TO_memory_mem_cas_n,       --             .mem_cas_n
			memory_mem_we_n        => CONNECTED_TO_memory_mem_we_n,        --             .mem_we_n
			memory_mem_reset_n     => CONNECTED_TO_memory_mem_reset_n,     --             .mem_reset_n
			memory_mem_dq          => CONNECTED_TO_memory_mem_dq,          --             .mem_dq
			memory_mem_dqs         => CONNECTED_TO_memory_mem_dqs,         --             .mem_dqs
			memory_mem_dqs_n       => CONNECTED_TO_memory_mem_dqs_n,       --             .mem_dqs_n
			memory_mem_odt         => CONNECTED_TO_memory_mem_odt,         --             .mem_odt
			memory_mem_dm          => CONNECTED_TO_memory_mem_dm,          --             .mem_dm
			memory_oct_rzqin       => CONNECTED_TO_memory_oct_rzqin,       --             .oct_rzqin
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --        reset.reset_n
			data_out_readdata      => CONNECTED_TO_data_out_readdata,      --     data_out.readdata
			data_out_address       => CONNECTED_TO_data_out_address,       --             .address
			data_out_read          => CONNECTED_TO_data_out_read           --             .read
		);

