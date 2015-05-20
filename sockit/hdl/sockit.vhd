library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit IS
	PORT(	
		CLOCK_50 		: in std_logic;
		RESET 			: in std_logic;
		
		DDR3_A       	: out   std_logic_vector(12 downto 0);                    -- mem_a
		DDR3_BA      	: out   std_logic_vector(2 downto 0);                     -- mem_ba
		DDR3_CK_p      : out   std_logic;                                        -- mem_ck
		DDR3_CK_n    	: out   std_logic;                                        -- mem_ck_n
		DDR3_CKE     	: out   std_logic;                                        -- mem_cke
		DDR3_CS_n    	: out   std_logic;                                        -- mem_cs_n
		DDR3_RAS_n   	: out   std_logic;                                        -- mem_ras_n
		DDR3_CAS_n   	: out   std_logic;                                        -- mem_cas_n
		DDR3_WE_n    	: out   std_logic;                                        -- mem_we_n
		DDR3_RESET_n 	: out   std_logic;                                        -- mem_reset_n
		DDR3_DQ      	: inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
		DDR3_DQS_p     : inout std_logic                     := 'X';             -- mem_dqs
		DDR3_DQS_n   	: inout std_logic                     := 'X';             -- mem_dqs_n
		DDR3_ODT     	: out   std_logic;                                        -- mem_odt
		DDR3_DM      	: out   std_logic;                                        -- mem_dm
		DDR3_RZQ   		: in    std_logic                     := 'X';             -- oct_rzqin
	
		KEY 				: in std_logic_vector(3 downto 0);
		LED 				: out std_logic_vector(3 downto 0)
	);
END sockit;
	
ARCHITECTURE behaviour OF sockit IS

	COMPONENT io_led
	PORT(	
		CLOCK_50 : in std_logic;
		RESET : in std_logic;
		
		leds_status : in std_logic_vector(3 downto 0);
		LED : out std_logic_vector(3 downto 0)
	);
	END COMPONENT;
	
	COMPONENT compute_main
	PORT(	
		CLOCK_50 : in std_logic;
		RESET : in std_logic;
		
		input_data : in std_logic_vector(127 downto 0);
		input_set : in std_logic;
		output_data : out std_logic_vector(127 downto 0);
		output_set : out std_logic;
		output_waitrequest : in std_logic;
		control_data : in std_logic_vector(31 downto 0);
		control_set : in std_logic;
		
		KEY : in std_logic_vector(3 downto 0);
		leds_status : out std_logic_vector(3 downto 0)
	);
	END COMPONENT;
	
	COMPONENT memory_io IS
	PORT (
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
	END COMPONENT memory_io;
	
	SIGNAL leds_status 	: std_logic_vector(3 downto 0);
	SIGNAL input_data 	: std_logic_vector(127 downto 0);
	SIGNAL input_set 		: std_logic;
	SIGNAL output_data 	: std_logic_vector(127 downto 0);
	SIGNAL output_set 	: std_logic;
	SIGNAL output_waitrequest : std_logic;
	SIGNAL control_data 	: std_logic_vector(31 downto 0);
	SIGNAL control_set 	: std_logic;

BEGIN
	G1 : io_led 		PORT MAP (CLOCK_50, RESET, leds_status, LED);
	G2 : compute_main PORT MAP (CLOCK_50, RESET, input_data, input_set, output_data, output_set, output_waitrequest, control_data, control_set, KEY, leds_status);
	G3 : memory_io 	PORT MAP (
		clk_clk            => CLOCK_50,     --    clk.clk
		memory_mem_a       => DDR3_A,       -- memory.mem_a
		memory_mem_ba      => DDR3_BA,      --       .mem_ba
		memory_mem_ck      => DDR3_CK_p,    --       .mem_ck
		memory_mem_ck_n    => DDR3_CK_n,    --       .mem_ck_n
		memory_mem_cke     => DDR3_CKE,     --       .mem_cke
		memory_mem_cs_n    => DDR3_CS_n,    --       .mem_cs_n
		memory_mem_ras_n   => DDR3_RAS_n,   --       .mem_ras_n
		memory_mem_cas_n   => DDR3_CAS_n,   --       .mem_cas_n
		memory_mem_we_n    => DDR3_WE_n,    --       .mem_we_n
		memory_mem_reset_n => DDR3_RESET_n, --       .mem_reset_n
		memory_mem_dq      => DDR3_DQ,      --       .mem_dq
		memory_mem_dqs     => DDR3_DQS_p,   --       .mem_dqs
		memory_mem_dqs_n   => DDR3_DQS_n,   --       .mem_dqs_n
		memory_mem_odt     => DDR3_ODT,     --       .mem_odt
		memory_mem_dm      => DDR3_DM,      --       .mem_dm
		memory_oct_rzqin   => DDR3_RZQ,   	--       .oct_rzqin
		reset_reset_n      => RESET       	--  reset.reset_n
	);
END behaviour;