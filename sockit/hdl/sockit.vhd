library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit IS
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
		
		--input_data : in std_logic_vector(127 downto 0);
		--input_set : in std_logic;
		--output_data : out std_logic_vector(127 downto 0);
		--output_set : out std_logic;
		--output_waitrequest : in std_logic;
		--control_data : in std_logic_vector(31 downto 0);
		--control_set : in std_logic;
	
		keys_in : in std_logic_vector(3 downto 0);
		leds_out : out std_logic_vector(3 downto 0)
	);
END sockit;
	
ARCHITECTURE behaviour OF sockit IS

	COMPONENT io_led
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
		
		leds_status : in std_logic_vector(3 downto 0);
		leds_out : out std_logic_vector(3 downto 0)
	);
	END COMPONENT;
	
	COMPONENT compute_main
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
		
		input_data : in std_logic_vector(127 downto 0);
		input_set : in std_logic;
		output_data : out std_logic_vector(127 downto 0);
		output_set : out std_logic;
		output_waitrequest : in std_logic;
		control_data : in std_logic_vector(31 downto 0);
		control_set : in std_logic;
		
		keys_in : in std_logic_vector(3 downto 0);
		leds_status : out std_logic_vector(3 downto 0)
	);
	END COMPONENT;
	
    component io_mem is
        port (
            clk_clk            : in    std_logic                     := 'X';             -- clk
            memory_mem_a       : out   std_logic_vector(12 downto 0);                    -- mem_a
            memory_mem_ba      : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck      : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n    : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke     : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n    : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n   : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n   : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n    : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq      : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
            memory_mem_dqs     : inout std_logic                     := 'X';             -- mem_dqs
            memory_mem_dqs_n   : inout std_logic                     := 'X';             -- mem_dqs_n
            memory_mem_odt     : out   std_logic;                                        -- mem_odt
            memory_mem_dm      : out   std_logic;                                        -- mem_dm
            memory_oct_rzqin   : in    std_logic                     := 'X';             -- oct_rzqin
            reset_reset_n      : in    std_logic                     := 'X'              -- reset_n
        );
    end component io_mem;
	

	
	SIGNAL leds_status 	: std_logic_vector(3 downto 0);
	SIGNAL input_data : std_logic_vector(127 downto 0);
	SIGNAL input_set : std_logic;
	SIGNAL output_data : std_logic_vector(127 downto 0);
	SIGNAL output_set : std_logic;
	SIGNAL output_waitrequest : std_logic;
	SIGNAL control_data : std_logic_vector(31 downto 0);
	SIGNAL control_set : std_logic;

BEGIN
	G1 : io_led 		PORT MAP (clock, reset, leds_status, leds_out);
	G2 : compute_main PORT MAP (clock, reset, input_data, input_set, output_data, output_set, output_waitrequest, control_data, control_set, keys_in, leds_status);
	u0 : component io_mem
        port map (
            clk_clk            => clock,            --    clk.clk
            memory_mem_a       => (hps_memory_mem_a),       -- memory.mem_a
            memory_mem_ba      => CONNECTED_TO_memory_mem_ba,      --       .mem_ba
            memory_mem_ck      => CONNECTED_TO_memory_mem_ck,      --       .mem_ck
            memory_mem_ck_n    => CONNECTED_TO_memory_mem_ck_n,    --       .mem_ck_n
            memory_mem_cke     => CONNECTED_TO_memory_mem_cke,     --       .mem_cke
            memory_mem_cs_n    => CONNECTED_TO_memory_mem_cs_n,    --       .mem_cs_n
            memory_mem_ras_n   => CONNECTED_TO_memory_mem_ras_n,   --       .mem_ras_n
            memory_mem_cas_n   => CONNECTED_TO_memory_mem_cas_n,   --       .mem_cas_n
            memory_mem_we_n    => CONNECTED_TO_memory_mem_we_n,    --       .mem_we_n
            memory_mem_reset_n => CONNECTED_TO_memory_mem_reset_n, --       .mem_reset_n
            memory_mem_dq      => CONNECTED_TO_memory_mem_dq,      --       .mem_dq
            memory_mem_dqs     => CONNECTED_TO_memory_mem_dqs,     --       .mem_dqs
            memory_mem_dqs_n   => CONNECTED_TO_memory_mem_dqs_n,   --       .mem_dqs_n
            memory_mem_odt     => CONNECTED_TO_memory_mem_odt,     --       .mem_odt
            memory_mem_dm      => CONNECTED_TO_memory_mem_dm,      --       .mem_dm
            memory_oct_rzqin   => CONNECTED_TO_memory_oct_rzqin,   --       .oct_rzqin
            reset_reset_n      => CONNECTED_TO_reset_reset_n       --  reset.reset_n
        );
END behaviour;