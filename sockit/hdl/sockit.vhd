library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit IS
PORT(
    CLOCK_50                        : in std_logic;
    RESET                           : in std_logic;
    hps_memory_mem_a            : out   std_logic_vector(12 downto 0);                    -- mem_a
    hps_memory_mem_ba           : out   std_logic_vector(2 downto 0);                     -- mem_ba
    hps_memory_mem_ck           : out   std_logic;                                        -- mem_ck
    hps_memory_mem_ck_n         : out   std_logic;                                        -- mem_ck_n
    hps_memory_mem_cke          : out   std_logic;                                        -- mem_cke
    hps_memory_mem_cs_n         : out   std_logic;                                        -- mem_cs_n
    hps_memory_mem_ras_n        : out   std_logic;                                        -- mem_ras_n
    hps_memory_mem_cas_n        : out   std_logic;                                        -- mem_cas_n
    hps_memory_mem_we_n         : out   std_logic;                                        -- mem_we_n
    hps_memory_mem_reset_n      : out   std_logic;                                        -- mem_reset_n
    hps_memory_mem_dq           : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- mem_dq
    hps_memory_mem_dqs          : inout std_logic                     := 'X';             -- mem_dqs
    hps_memory_mem_dqs_n        : inout std_logic                     := 'X';             -- mem_dqs_n
    hps_memory_mem_odt          : out   std_logic;                                        -- mem_odt
    hps_memory_mem_dm           : out   std_logic;                                        -- mem_dm
    hps_memory_oct_rzqin        : in    std_logic                     := 'X';             -- oct_rzqin
    
    KEY                             : in std_logic_vector(3 downto 0);
    SWITCH                          : in std_logic_vector(3 downto 0);
    LED                             : out std_logic_vector(3 downto 0)
    );
END sockit;

ARCHITECTURE behaviour OF sockit IS

COMPONENT io_led
PORT(
    clock       : in std_logic;
    reset       : in std_logic;
    leds_status : in std_logic_vector(3 downto 0);
    leds_output : out std_logic_vector(3 downto 0)
    );
END COMPONENT;

COMPONENT compute_main
PORT (
	keys_input        : in std_logic_vector(3 downto 0);
	switches_input    : in std_logic_vector(3 downto 0);
	control_write     : in std_logic_vector(0 downto 0);
	control_writedata : in std_logic_vector(31 downto 0);
	control_address   : in std_logic_vector(7 downto 0);
	control_read      : in std_logic_vector(0 downto 0);
	in_write          : in std_logic_vector(0 downto 0);
	in_writedata      : in std_logic_vector(31 downto 0);
	in_address        : in std_logic_vector(7 downto 0);
	out_address       : in std_logic_vector(7 downto 0);
	-- clock
	system1000        : in std_logic;
	-- asynchronous reset: active low
	system1000_rstn   : in std_logic;
	leds_status       : out std_logic_vector(3 downto 0);
	control_readdata  : out std_logic_vector(31 downto 0);
	out_readdata      : out std_logic_vector(31 downto 0);
	out_read		  : in std_logic_vector(0 downto 0)
	);
END COMPONENT;

COMPONENT memory_io
PORT (
    clk_clk                : in    std_logic                     := 'X';             -- clk
    data_control_writedata : out   std_logic_vector(31 downto 0);                    -- writedata
    data_control_readdata  : in    std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
    data_control_address   : out   std_logic_vector(7 downto 0);                     -- address
    data_control_read      : out   std_logic;                                        -- read
    data_control_write     : out   std_logic;                                        -- write
    data_in_write          : out   std_logic;                                        -- write
    data_in_writedata      : out   std_logic_vector(31 downto 0);                    -- writedata
    data_in_address        : out   std_logic_vector(7 downto 0);                     -- address
    data_out_readdata      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
    data_out_address       : out   std_logic_vector(7 downto 0);                     -- address
    data_out_read 			: out   std_logic;
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
    reset_reset_n          : in    std_logic                     := 'X'              -- reset_n
    );
END COMPONENT;

-- Physical
SIGNAL leds_status 			: std_logic_vector(3 downto 0);

-- Avalon interface
SIGNAL in_write      		: std_logic;
SIGNAL in_writedata 			: std_logic_vector(31 downto 0);
SIGNAL in_address				: std_logic_vector(7 downto 0);

SIGNAL control_writedata	: std_logic_vector(31 downto 0);
SIGNAL control_readdata   	: std_logic_vector(31 downto 0);
SIGNAL control_address     : std_logic_vector(7 downto 0);
SIGNAL control_read        : std_logic;
SIGNAL control_write       : std_logic;

SIGNAL out_readdata        : std_logic_vector(31 downto 0);
SIGNAL out_address         : std_logic_vector(7 downto 0);
SIGNAL out_read				: std_logic;

BEGIN
G1 : io_led         PORT MAP (
    clock                   => CLOCK_50,
    reset                   => RESET,
    leds_status             => leds_status,
    leds_output             => LED
    );
G2 : compute_main PORT MAP (
    system1000          => CLOCK_50,
    system1000_rstn    	=> RESET,   
    control_writedata   => control_writedata,
    control_readdata    => control_readdata,
    control_address     => control_address,
    control_read(0)     => control_read,
    control_write(0)    => control_write,
    in_write(0)         => in_write,
    in_writedata        => in_writedata,
    in_address          => in_address,
	 out_read(0)			=> out_read,
    out_readdata        => out_readdata,
    out_address         => out_address,
    keys_input          => KEY,
    switches_input      => SWITCH,
    leds_status         => leds_status
    );
G3 : memory_io PORT MAP (
    clk_clk                => CLOCK_50,                --          clk.clk
    memory_mem_a           => hps_memory_mem_a,        --     memory.mem_a
    memory_mem_ba          => hps_memory_mem_ba,       --           .mem_ba
    memory_mem_ck          => hps_memory_mem_ck,       --           .mem_ck
    memory_mem_ck_n        => hps_memory_mem_ck_n,     --           .mem_ck_n
    memory_mem_cke         => hps_memory_mem_cke,      --           .mem_cke
    memory_mem_cs_n        => hps_memory_mem_cs_n,     --           .mem_cs_n
    memory_mem_ras_n       => hps_memory_mem_ras_n,    --           .mem_ras_n
    memory_mem_cas_n       => hps_memory_mem_cas_n,    --           .mem_cas_n
    memory_mem_we_n        => hps_memory_mem_we_n,     --           .mem_we_n
    memory_mem_reset_n     => hps_memory_mem_reset_n,   --           .mem_reset_n
    memory_mem_dq          => hps_memory_mem_dq,       --           .mem_dq
    memory_mem_dqs         => hps_memory_mem_dqs,      --           .mem_dqs
    memory_mem_dqs_n       => hps_memory_mem_dqs_n,    --           .mem_dqs_n
    memory_mem_odt         => hps_memory_mem_odt,      --           .mem_odt
    memory_mem_dm          => hps_memory_mem_dm,       --           .mem_dm
    memory_oct_rzqin       => hps_memory_oct_rzqin,    --           .oct_rzqin
    reset_reset_n          => RESET,                    --        reset.reset_n
    data_in_write          => in_write,                 --      data_in.write
    data_in_writedata      => in_writedata,             --             .writedata
    data_in_address        => in_address,               --             .address
    data_control_writedata => control_writedata,        -- data_control.writedata
    data_control_readdata  => control_readdata,         --             .readdata
    data_control_address   => control_address,          --             .address
    data_control_read      => control_read,             --             .read
    data_control_write     => control_write,            --             .write
    data_out_readdata      => out_readdata,             --     data_out.readdata
    data_out_address       => out_address,              --             .address
	 data_out_read 			=> out_read
    );
END behaviour;


