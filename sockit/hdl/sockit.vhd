library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit IS
PORT(
	CLOCK_50 						: in std_logic;
	RESET 							: in std_logic;
	hps_memory_mem_a       		: out   std_logic_vector(12 downto 0);                    -- mem_a
	hps_memory_mem_ba      		: out   std_logic_vector(2 downto 0);                     -- mem_ba
	hps_memory_mem_ck      		: out   std_logic;                                        -- mem_ck
	hps_memory_mem_ck_n    		: out   std_logic;                                        -- mem_ck_n
	hps_memory_mem_cke     		: out   std_logic;                                        -- mem_cke
	hps_memory_mem_cs_n    		: out   std_logic;                                        -- mem_cs_n
	hps_memory_mem_ras_n   		: out   std_logic;                                        -- mem_ras_n
	hps_memory_mem_cas_n   		: out   std_logic;                                        -- mem_cas_n
	hps_memory_mem_we_n    		: out   std_logic;                                        -- mem_we_n
	hps_memory_mem_reset_n 		: out   std_logic;                                        -- mem_reset_n
	hps_memory_mem_dq      		: inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
	hps_memory_mem_dqs     		: inout std_logic                     := 'X';             -- mem_dqs
	hps_memory_mem_dqs_n   		: inout std_logic                     := 'X';             -- mem_dqs_n
	hps_memory_mem_odt     		: out   std_logic;                                        -- mem_odt
	hps_memory_mem_dm      		: out   std_logic;                                        -- mem_dm
	hps_memory_oct_rzqin   		: in    std_logic                     := 'X';             -- oct_rzqin
	KEY 								: in std_logic_vector(3 downto 0);
	SWITCH							: in std_logic_vector(3 downto 0);
	LED 								: out std_logic_vector(3 downto 0)
	);
END sockit;

ARCHITECTURE behaviour OF sockit IS

COMPONENT io_led
PORT(
	clock 		: in std_logic;
	reset 		: in std_logic;
	leds_status : in std_logic_vector(3 downto 0);
	leds_output : out std_logic_vector(3 downto 0)
	);
END COMPONENT;

COMPONENT compute_main
PORT(
	clock 					: in std_logic;
	reset 					: in std_logic;
	input_data 				: in std_logic_vector(127 downto 0);
	input_set 				: in std_logic;
	output_data 			: out std_logic_vector(127 downto 0);
	output_set 				: out std_logic;
	output_waitrequest 	: in std_logic;
	control_data 			: in std_logic_vector(31 downto 0);
	control_set 			: in std_logic;
	keys_input 				: in std_logic_vector(3 downto 0);
	switches_input			: in std_logic_vector(3 downto 0);
	leds_status 			: out std_logic_vector(3 downto 0)
	);
END COMPONENT;

COMPONENT memory_io IS
PORT (
	clk_clk                          : in    std_logic                      := 'X';             -- clk
	memory_mem_a                     : out   std_logic_vector(12 downto 0);                     -- mem_a
	memory_mem_ba                    : out   std_logic_vector(2 downto 0);                      -- mem_ba
	memory_mem_ck                    : out   std_logic;                                         -- mem_ck
	memory_mem_ck_n                  : out   std_logic;                                         -- mem_ck_n
	memory_mem_cke                   : out   std_logic;                                         -- mem_cke
	memory_mem_cs_n                  : out   std_logic;                                         -- mem_cs_n
	memory_mem_ras_n                 : out   std_logic;                                         -- mem_ras_n
	memory_mem_cas_n                 : out   std_logic;                                         -- mem_cas_n
	memory_mem_we_n                  : out   std_logic;                                         -- mem_we_n
	memory_mem_reset_n               : out   std_logic;                                         -- mem_reset_n
	memory_mem_dq                    : inout std_logic_vector(7 downto 0)   := (others => 'X'); -- mem_dq
	memory_mem_dqs                   : inout std_logic                      := 'X';             -- mem_dqs
	memory_mem_dqs_n                 : inout std_logic                      := 'X';             -- mem_dqs_n
	memory_mem_odt                   : out   std_logic;                                         -- mem_odt
	memory_mem_dm                    : out   std_logic;                                         -- mem_dm
	memory_oct_rzqin                 : in    std_logic                      := 'X';             -- oct_rzqin
	reset_reset_n                    : in    std_logic                      := 'X';             -- reset_n


	conduit_export_control_data 		: out   std_logic_vector(31 downto 0);                     -- export_control_data
	conduit_export_control_set  		: out   std_logic; 	                                      -- export_control_set
	conduit_export_input_data        : out   std_logic_vector(127 downto 0);                    -- export_input_data
	conduit_export_input_set         : out   std_logic;                                         -- export_input_set
	conduit_export_output_data       : in    std_logic_vector(127 downto 0) := (others => 'X'); -- export_output_data
	conduit_export_output_set       	: in    std_logic                      := 'X';             -- export_output_set
	conduit_export_output_waitrequest: out   std_logic                                          -- export_output_waitrequest
	);
END COMPONENT memory_io;


SIGNAL leds_status 			: std_logic_vector(3 downto 0);
SIGNAL input_data 			: std_logic_vector(127 downto 0);
SIGNAL input_set 				: std_logic;
SIGNAL output_data 			: std_logic_vector(127 downto 0);
SIGNAL output_set 			: std_logic;
SIGNAL output_waitrequest 	: std_logic;
SIGNAL control_data 			: std_logic_vector(31 downto 0);
SIGNAL control_set 			: std_logic;

BEGIN
G1 : io_led 		PORT MAP (
	clock 					=> CLOCK_50,
	reset 					=> RESET,
	leds_status				=> leds_status,
	leds_output 			=> LED
	);
G2 : compute_main PORT MAP (
	clock 					=> CLOCK_50,
	reset						=> RESET,
	input_data				=> input_data,
	input_set				=> input_set,
	output_data				=> output_data,
	output_set				=> output_set,
	output_waitrequest	=> output_waitrequest,
	control_data 			=> control_data,
	control_set 			=> control_set,
	keys_input				=> KEY,
	switches_input			=> SWITCH,
	leds_status				=> leds_status
	);
G3 : memory_io 	PORT MAP (
	clk_clk            	=> CLOCK_50,     						--    clk.clk
	memory_mem_a       	=> hps_memory_mem_a,       	-- memory.mem_a
	memory_mem_ba      	=> hps_memory_mem_ba,      	--       .mem_ba
	memory_mem_ck      	=> hps_memory_mem_ck,    		--       .mem_ck
	memory_mem_ck_n    	=> hps_memory_mem_ck_n,    	--       .mem_ck_n
	memory_mem_cke     	=> hps_memory_mem_cke,     	--       .mem_cke
	memory_mem_cs_n    	=> hps_memory_mem_cs_n,    	--       .mem_cs_n
	memory_mem_ras_n   	=> hps_memory_mem_ras_n,   	--       .mem_ras_n
	memory_mem_cas_n   	=> hps_memory_mem_cas_n,   	--       .mem_cas_n
	memory_mem_we_n    	=> hps_memory_mem_we_n,    	--       .mem_we_n
	memory_mem_reset_n 	=> hps_memory_mem_reset_n, 	--       .mem_reset_n
	memory_mem_dq      	=> hps_memory_mem_dq,      	--       .mem_dq
	memory_mem_dqs     	=> hps_memory_mem_dqs,   		--       .mem_dqs
	memory_mem_dqs_n   	=> hps_memory_mem_dqs_n,   	--       .mem_dqs_n
	memory_mem_odt     	=> hps_memory_mem_odt,     	--       .mem_odt
	memory_mem_dm      	=> hps_memory_mem_dm,      	--       .mem_dm
	memory_oct_rzqin   	=> hps_memory_oct_rzqin,   	--       .oct_rzqin
	reset_reset_n      	=> RESET,       						--  reset.reset_n

	conduit_export_control_data 		=> control_data, 				-- conduit.export_control_data
	conduit_export_control_set  		=> control_set,   			--        .export_control_set
	conduit_export_input_data   		=> input_data,   				--        .export_input_data
	conduit_export_input_set    		=> input_set,    				--        .export_input_set
	conduit_export_output_data       => output_data,        --        .export_output_data
	conduit_export_output_set        => output_set,         --        .export_output_set
	conduit_export_output_waitrequest=> output_waitrequest 	--        .export_output_waitrequest
	);
END behaviour;
