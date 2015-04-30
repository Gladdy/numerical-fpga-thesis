-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "04/28/2015 23:36:21"

-- 
-- Device: Altera 5CSXFC6D6F31C8ES Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	first_fpga IS
    PORT (
	LED : OUT std_logic_vector(3 DOWNTO 0);
	KEY : IN std_logic_vector(1 DOWNTO 0);
	CLOCK_50 : IN std_logic
	);
END first_fpga;

-- Design Ports Information
-- LED[3]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF first_fpga IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LED : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ : std_logic;
SIGNAL \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\ : std_logic;
SIGNAL \inst|counter_out[0]~0_combout\ : std_logic;
SIGNAL \inst|Add0~101_sumout\ : std_logic;
SIGNAL \inst|Add0~102\ : std_logic;
SIGNAL \inst|Add0~97_sumout\ : std_logic;
SIGNAL \inst|Add0~98\ : std_logic;
SIGNAL \inst|Add0~93_sumout\ : std_logic;
SIGNAL \inst|Add0~94\ : std_logic;
SIGNAL \inst|Add0~89_sumout\ : std_logic;
SIGNAL \inst|Add0~90\ : std_logic;
SIGNAL \inst|Add0~85_sumout\ : std_logic;
SIGNAL \inst|Add0~86\ : std_logic;
SIGNAL \inst|Add0~81_sumout\ : std_logic;
SIGNAL \inst|Add0~82\ : std_logic;
SIGNAL \inst|Add0~77_sumout\ : std_logic;
SIGNAL \inst|Add0~78\ : std_logic;
SIGNAL \inst|Add0~73_sumout\ : std_logic;
SIGNAL \inst|Add0~74\ : std_logic;
SIGNAL \inst|Add0~69_sumout\ : std_logic;
SIGNAL \inst|Add0~70\ : std_logic;
SIGNAL \inst|Add0~65_sumout\ : std_logic;
SIGNAL \inst|Add0~66\ : std_logic;
SIGNAL \inst|Add0~61_sumout\ : std_logic;
SIGNAL \inst|Add0~62\ : std_logic;
SIGNAL \inst|Add0~57_sumout\ : std_logic;
SIGNAL \inst|Add0~58\ : std_logic;
SIGNAL \inst|Add0~53_sumout\ : std_logic;
SIGNAL \inst|Add0~54\ : std_logic;
SIGNAL \inst|Add0~49_sumout\ : std_logic;
SIGNAL \inst|Add0~50\ : std_logic;
SIGNAL \inst|Add0~45_sumout\ : std_logic;
SIGNAL \inst|Add0~46\ : std_logic;
SIGNAL \inst|Add0~41_sumout\ : std_logic;
SIGNAL \inst|Add0~42\ : std_logic;
SIGNAL \inst|Add0~37_sumout\ : std_logic;
SIGNAL \inst|Add0~38\ : std_logic;
SIGNAL \inst|Add0~33_sumout\ : std_logic;
SIGNAL \inst|Add0~34\ : std_logic;
SIGNAL \inst|Add0~29_sumout\ : std_logic;
SIGNAL \inst|Add0~30\ : std_logic;
SIGNAL \inst|Add0~25_sumout\ : std_logic;
SIGNAL \inst|Add0~26\ : std_logic;
SIGNAL \inst|Add0~21_sumout\ : std_logic;
SIGNAL \inst|Add0~22\ : std_logic;
SIGNAL \inst|Add0~17_sumout\ : std_logic;
SIGNAL \inst|Add0~18\ : std_logic;
SIGNAL \inst|Add0~13_sumout\ : std_logic;
SIGNAL \inst|Add0~14\ : std_logic;
SIGNAL \inst|Add0~5_sumout\ : std_logic;
SIGNAL \inst|Add0~6\ : std_logic;
SIGNAL \inst|Add0~9_sumout\ : std_logic;
SIGNAL \inst|Add0~10\ : std_logic;
SIGNAL \inst|Add0~1_sumout\ : std_logic;
SIGNAL \inst2|LPM_MUX_component|auto_generated|l1_w3_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \inst2|LPM_MUX_component|auto_generated|l1_w2_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \inst2|LPM_MUX_component|auto_generated|l1_w1_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \inst2|LPM_MUX_component|auto_generated|l1_w0_n0_mux_dataout~0_combout\ : std_logic;
SIGNAL \inst|counter_out\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|fboutclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \inst1|pll_inst|altera_pll_i|outclk_wire\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \ALT_INV_KEY[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;
SIGNAL \inst|ALT_INV_counter_out\ : std_logic_vector(26 DOWNTO 0);

BEGIN

LED <= ww_LED;
ww_KEY <= KEY;
ww_CLOCK_50 <= CLOCK_50;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(0);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(1);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(2);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(3);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(4);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(5);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(6);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\(7);

\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(0);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(1);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(2);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(3);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(4);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(5);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(6);
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\(7);

\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\ <= (gnd & gnd & gnd & \CLOCK_50~input_o\);

\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\ <= (\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI7\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI6\ & 
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI5\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI4\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI3\ & 
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI2\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI1\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_MHI0\);

\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\ <= \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\(6);

\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\ <= (\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH7\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH6\ & 
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH5\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH4\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH3\ & 
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH2\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH1\ & \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_VCOPH0\);
\ALT_INV_KEY[1]~input_o\ <= NOT \KEY[1]~input_o\;
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
\inst|ALT_INV_counter_out\(0) <= NOT \inst|counter_out\(0);
\inst|ALT_INV_counter_out\(1) <= NOT \inst|counter_out\(1);
\inst|ALT_INV_counter_out\(2) <= NOT \inst|counter_out\(2);
\inst|ALT_INV_counter_out\(3) <= NOT \inst|counter_out\(3);
\inst|ALT_INV_counter_out\(4) <= NOT \inst|counter_out\(4);
\inst|ALT_INV_counter_out\(5) <= NOT \inst|counter_out\(5);
\inst|ALT_INV_counter_out\(6) <= NOT \inst|counter_out\(6);
\inst|ALT_INV_counter_out\(7) <= NOT \inst|counter_out\(7);
\inst|ALT_INV_counter_out\(8) <= NOT \inst|counter_out\(8);
\inst|ALT_INV_counter_out\(9) <= NOT \inst|counter_out\(9);
\inst|ALT_INV_counter_out\(10) <= NOT \inst|counter_out\(10);
\inst|ALT_INV_counter_out\(11) <= NOT \inst|counter_out\(11);
\inst|ALT_INV_counter_out\(12) <= NOT \inst|counter_out\(12);
\inst|ALT_INV_counter_out\(13) <= NOT \inst|counter_out\(13);
\inst|ALT_INV_counter_out\(14) <= NOT \inst|counter_out\(14);
\inst|ALT_INV_counter_out\(15) <= NOT \inst|counter_out\(15);
\inst|ALT_INV_counter_out\(16) <= NOT \inst|counter_out\(16);
\inst|ALT_INV_counter_out\(17) <= NOT \inst|counter_out\(17);
\inst|ALT_INV_counter_out\(18) <= NOT \inst|counter_out\(18);
\inst|ALT_INV_counter_out\(19) <= NOT \inst|counter_out\(19);
\inst|ALT_INV_counter_out\(20) <= NOT \inst|counter_out\(20);
\inst|ALT_INV_counter_out\(21) <= NOT \inst|counter_out\(21);
\inst|ALT_INV_counter_out\(22) <= NOT \inst|counter_out\(22);
\inst|ALT_INV_counter_out\(23) <= NOT \inst|counter_out\(23);
\inst|ALT_INV_counter_out\(25) <= NOT \inst|counter_out\(25);
\inst|ALT_INV_counter_out\(24) <= NOT \inst|counter_out\(24);
\inst|ALT_INV_counter_out\(26) <= NOT \inst|counter_out\(26);

-- Location: IOOBUF_X6_Y0_N2
\LED[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LPM_MUX_component|auto_generated|l1_w3_n0_mux_dataout~0_combout\,
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X4_Y0_N36
\LED[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LPM_MUX_component|auto_generated|l1_w2_n0_mux_dataout~0_combout\,
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X4_Y0_N19
\LED[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LPM_MUX_component|auto_generated|l1_w1_n0_mux_dataout~0_combout\,
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X4_Y0_N53
\LED[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst2|LPM_MUX_component|auto_generated|l1_w0_n0_mux_dataout~0_combout\,
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOIBUF_X2_Y0_N92
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X32_Y0_N1
\CLOCK_50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: PLLREFCLKSELECT_X0_Y21_N0
\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT\ : cyclonev_pll_refclk_select
-- pragma translate_off
GENERIC MAP (
	pll_auto_clk_sw_en => "false",
	pll_clk_loss_edge => "both_edges",
	pll_clk_loss_sw_en => "false",
	pll_clk_sw_dly => 0,
	pll_clkin_0_src => "clk_0",
	pll_clkin_1_src => "ref_clk1",
	pll_manu_clk_sw_en => "false",
	pll_sw_refclk_src => "clk_0")
-- pragma translate_on
PORT MAP (
	clkin => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_CLKIN_bus\,
	clkout => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	extswitchbuf => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\);

-- Location: IOIBUF_X2_Y0_N58
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: FRACTIONALPLL_X0_Y15_N0
\inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL\ : cyclonev_fractional_pll
-- pragma translate_off
GENERIC MAP (
	dsm_accumulator_reset_value => 0,
	forcelock => "false",
	mimic_fbclk_type => "gclk_far",
	nreset_invert => "true",
	output_clock_frequency => "300.0 mhz",
	pll_atb => 0,
	pll_bwctrl => 4000,
	pll_cmp_buf_dly => "0 ps",
	pll_cp_comp => "true",
	pll_cp_current => 10,
	pll_ctrl_override_setting => "false",
	pll_dsm_dither => "disable",
	pll_dsm_out_sel => "disable",
	pll_dsm_reset => "false",
	pll_ecn_bypass => "false",
	pll_ecn_test_en => "false",
	pll_enable => "true",
	pll_fbclk_mux_1 => "glb",
	pll_fbclk_mux_2 => "fb_1",
	pll_fractional_carry_out => 32,
	pll_fractional_division => 1,
	pll_fractional_division_string => "'0'",
	pll_fractional_value_ready => "true",
	pll_lf_testen => "false",
	pll_lock_fltr_cfg => 25,
	pll_lock_fltr_test => "false",
	pll_m_cnt_bypass_en => "false",
	pll_m_cnt_coarse_dly => "600 ps",
	pll_m_cnt_fine_dly => "0 ps",
	pll_m_cnt_hi_div => 6,
	pll_m_cnt_in_src => "ph_mux_clk",
	pll_m_cnt_lo_div => 6,
	pll_m_cnt_odd_div_duty_en => "false",
	pll_m_cnt_ph_mux_prst => 0,
	pll_m_cnt_prst => 1,
	pll_n_cnt_bypass_en => "false",
	pll_n_cnt_coarse_dly => "0 ps",
	pll_n_cnt_fine_dly => "0 ps",
	pll_n_cnt_hi_div => 1,
	pll_n_cnt_lo_div => 1,
	pll_n_cnt_odd_div_duty_en => "false",
	pll_ref_buf_dly => "0 ps",
	pll_reg_boost => 0,
	pll_regulator_bypass => "false",
	pll_ripplecap_ctrl => 0,
	pll_slf_rst => "false",
	pll_tclk_mux_en => "false",
	pll_tclk_sel => "n_src",
	pll_test_enable => "false",
	pll_testdn_enable => "false",
	pll_testup_enable => "false",
	pll_unlock_fltr_cfg => 2,
	pll_vco_div => 2,
	pll_vco_ph0_en => "true",
	pll_vco_ph1_en => "true",
	pll_vco_ph2_en => "true",
	pll_vco_ph3_en => "true",
	pll_vco_ph4_en => "true",
	pll_vco_ph5_en => "true",
	pll_vco_ph6_en => "true",
	pll_vco_ph7_en => "true",
	pll_vctrl_test_voltage => 750,
	reference_clock_frequency => "50.0 mhz",
	vccd0g_atb => "disable",
	vccd0g_output => 0,
	vccd1g_atb => "disable",
	vccd1g_output => 0,
	vccm1g_tap => 2,
	vccr_pd => "false",
	vcodiv_override => "false",
	fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	coreclkfb => \inst1|pll_inst|altera_pll_i|fboutclk_wire\(0),
	ecnc1test => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_EXTSWITCHBUF\,
	nresync => \ALT_INV_KEY[1]~input_o\,
	refclkin => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_REFCLK_SELECT_O_CLKOUT\,
	shift => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftdonein => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	cntnen => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	fbclk => \inst1|pll_inst|altera_pll_i|fboutclk_wire\(0),
	tclk => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	vcoph => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_VCOPH_bus\,
	mhi => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_MHI_bus\);

-- Location: PLLRECONFIG_X0_Y19_N0
\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG\ : cyclonev_pll_reconfig
-- pragma translate_off
GENERIC MAP (
	fractional_pll_index => 0)
-- pragma translate_on
PORT MAP (
	cntnen => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	mhi => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_MHI_bus\,
	shift => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiftenm => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFTENM\,
	up => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	shiften => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_SHIFTEN_bus\);

-- Location: PLLOUTPUTCOUNTER_X0_Y20_N1
\inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER\ : cyclonev_pll_output_counter
-- pragma translate_off
GENERIC MAP (
	c_cnt_coarse_dly => "0 ps",
	c_cnt_fine_dly => "0 ps",
	c_cnt_in_src => "ph_mux_clk",
	c_cnt_ph_mux_prst => 0,
	c_cnt_prst => 1,
	cnt_fpll_src => "fpll_0",
	dprio0_cnt_bypass_en => "false",
	dprio0_cnt_hi_div => 30,
	dprio0_cnt_lo_div => 30,
	dprio0_cnt_odd_div_even_duty_en => "false",
	duty_cycle => 50,
	output_clock_frequency => "5.0 mhz",
	phase_shift => "0 ps",
	fractional_pll_index => 0,
	output_counter_index => 6)
-- pragma translate_on
PORT MAP (
	nen0 => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_CNTNEN\,
	shift0 => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_SHIFT\,
	shiften => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIGSHIFTEN6\,
	tclk0 => \inst1|pll_inst|altera_pll_i|general[0].gpll~FRACTIONAL_PLL_O_TCLK\,
	up0 => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_RECONFIG_O_UP\,
	vco0ph => \inst1|pll_inst|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER_VCO0PH_bus\,
	divclk => \inst1|pll_inst|altera_pll_i|outclk_wire\(0));

-- Location: CLKCTRL_G0
\inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \inst1|pll_inst|altera_pll_i|outclk_wire\(0),
	outclk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\);

-- Location: LABCELL_X4_Y2_N0
\inst|counter_out[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|counter_out[0]~0_combout\ = ( !\inst|counter_out\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \inst|ALT_INV_counter_out\(0),
	combout => \inst|counter_out[0]~0_combout\);

-- Location: FF_X4_Y2_N1
\inst|counter_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|counter_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(0));

-- Location: LABCELL_X4_Y2_N30
\inst|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~101_sumout\ = SUM(( \inst|counter_out\(1) ) + ( \inst|counter_out\(0) ) + ( !VCC ))
-- \inst|Add0~102\ = CARRY(( \inst|counter_out\(1) ) + ( \inst|counter_out\(0) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \inst|ALT_INV_counter_out\(0),
	datad => \inst|ALT_INV_counter_out\(1),
	cin => GND,
	sumout => \inst|Add0~101_sumout\,
	cout => \inst|Add0~102\);

-- Location: FF_X4_Y2_N32
\inst|counter_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~101_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(1));

-- Location: LABCELL_X4_Y2_N33
\inst|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~97_sumout\ = SUM(( \inst|counter_out\(2) ) + ( GND ) + ( \inst|Add0~102\ ))
-- \inst|Add0~98\ = CARRY(( \inst|counter_out\(2) ) + ( GND ) + ( \inst|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(2),
	cin => \inst|Add0~102\,
	sumout => \inst|Add0~97_sumout\,
	cout => \inst|Add0~98\);

-- Location: FF_X4_Y2_N35
\inst|counter_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~97_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(2));

-- Location: LABCELL_X4_Y2_N36
\inst|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~93_sumout\ = SUM(( \inst|counter_out\(3) ) + ( GND ) + ( \inst|Add0~98\ ))
-- \inst|Add0~94\ = CARRY(( \inst|counter_out\(3) ) + ( GND ) + ( \inst|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(3),
	cin => \inst|Add0~98\,
	sumout => \inst|Add0~93_sumout\,
	cout => \inst|Add0~94\);

-- Location: FF_X4_Y2_N38
\inst|counter_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~93_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(3));

-- Location: LABCELL_X4_Y2_N39
\inst|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~89_sumout\ = SUM(( \inst|counter_out\(4) ) + ( GND ) + ( \inst|Add0~94\ ))
-- \inst|Add0~90\ = CARRY(( \inst|counter_out\(4) ) + ( GND ) + ( \inst|Add0~94\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(4),
	cin => \inst|Add0~94\,
	sumout => \inst|Add0~89_sumout\,
	cout => \inst|Add0~90\);

-- Location: FF_X4_Y2_N41
\inst|counter_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~89_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(4));

-- Location: LABCELL_X4_Y2_N42
\inst|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~85_sumout\ = SUM(( \inst|counter_out\(5) ) + ( GND ) + ( \inst|Add0~90\ ))
-- \inst|Add0~86\ = CARRY(( \inst|counter_out\(5) ) + ( GND ) + ( \inst|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(5),
	cin => \inst|Add0~90\,
	sumout => \inst|Add0~85_sumout\,
	cout => \inst|Add0~86\);

-- Location: FF_X4_Y2_N44
\inst|counter_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~85_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(5));

-- Location: LABCELL_X4_Y2_N45
\inst|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~81_sumout\ = SUM(( \inst|counter_out\(6) ) + ( GND ) + ( \inst|Add0~86\ ))
-- \inst|Add0~82\ = CARRY(( \inst|counter_out\(6) ) + ( GND ) + ( \inst|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(6),
	cin => \inst|Add0~86\,
	sumout => \inst|Add0~81_sumout\,
	cout => \inst|Add0~82\);

-- Location: FF_X4_Y2_N47
\inst|counter_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~81_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(6));

-- Location: LABCELL_X4_Y2_N48
\inst|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~77_sumout\ = SUM(( \inst|counter_out\(7) ) + ( GND ) + ( \inst|Add0~82\ ))
-- \inst|Add0~78\ = CARRY(( \inst|counter_out\(7) ) + ( GND ) + ( \inst|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(7),
	cin => \inst|Add0~82\,
	sumout => \inst|Add0~77_sumout\,
	cout => \inst|Add0~78\);

-- Location: FF_X4_Y2_N50
\inst|counter_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~77_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(7));

-- Location: LABCELL_X4_Y2_N51
\inst|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~73_sumout\ = SUM(( \inst|counter_out\(8) ) + ( GND ) + ( \inst|Add0~78\ ))
-- \inst|Add0~74\ = CARRY(( \inst|counter_out\(8) ) + ( GND ) + ( \inst|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(8),
	cin => \inst|Add0~78\,
	sumout => \inst|Add0~73_sumout\,
	cout => \inst|Add0~74\);

-- Location: FF_X4_Y2_N53
\inst|counter_out[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~73_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(8));

-- Location: LABCELL_X4_Y2_N54
\inst|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~69_sumout\ = SUM(( \inst|counter_out\(9) ) + ( GND ) + ( \inst|Add0~74\ ))
-- \inst|Add0~70\ = CARRY(( \inst|counter_out\(9) ) + ( GND ) + ( \inst|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(9),
	cin => \inst|Add0~74\,
	sumout => \inst|Add0~69_sumout\,
	cout => \inst|Add0~70\);

-- Location: FF_X4_Y2_N56
\inst|counter_out[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~69_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(9));

-- Location: LABCELL_X4_Y2_N57
\inst|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~65_sumout\ = SUM(( \inst|counter_out\(10) ) + ( GND ) + ( \inst|Add0~70\ ))
-- \inst|Add0~66\ = CARRY(( \inst|counter_out\(10) ) + ( GND ) + ( \inst|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(10),
	cin => \inst|Add0~70\,
	sumout => \inst|Add0~65_sumout\,
	cout => \inst|Add0~66\);

-- Location: FF_X4_Y2_N59
\inst|counter_out[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~65_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(10));

-- Location: LABCELL_X4_Y1_N0
\inst|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~61_sumout\ = SUM(( \inst|counter_out\(11) ) + ( GND ) + ( \inst|Add0~66\ ))
-- \inst|Add0~62\ = CARRY(( \inst|counter_out\(11) ) + ( GND ) + ( \inst|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(11),
	cin => \inst|Add0~66\,
	sumout => \inst|Add0~61_sumout\,
	cout => \inst|Add0~62\);

-- Location: FF_X4_Y1_N2
\inst|counter_out[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~61_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(11));

-- Location: LABCELL_X4_Y1_N3
\inst|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~57_sumout\ = SUM(( \inst|counter_out\(12) ) + ( GND ) + ( \inst|Add0~62\ ))
-- \inst|Add0~58\ = CARRY(( \inst|counter_out\(12) ) + ( GND ) + ( \inst|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(12),
	cin => \inst|Add0~62\,
	sumout => \inst|Add0~57_sumout\,
	cout => \inst|Add0~58\);

-- Location: FF_X4_Y1_N5
\inst|counter_out[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~57_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(12));

-- Location: LABCELL_X4_Y1_N6
\inst|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~53_sumout\ = SUM(( \inst|counter_out\(13) ) + ( GND ) + ( \inst|Add0~58\ ))
-- \inst|Add0~54\ = CARRY(( \inst|counter_out\(13) ) + ( GND ) + ( \inst|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(13),
	cin => \inst|Add0~58\,
	sumout => \inst|Add0~53_sumout\,
	cout => \inst|Add0~54\);

-- Location: FF_X4_Y1_N8
\inst|counter_out[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~53_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(13));

-- Location: LABCELL_X4_Y1_N9
\inst|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~49_sumout\ = SUM(( \inst|counter_out\(14) ) + ( GND ) + ( \inst|Add0~54\ ))
-- \inst|Add0~50\ = CARRY(( \inst|counter_out\(14) ) + ( GND ) + ( \inst|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(14),
	cin => \inst|Add0~54\,
	sumout => \inst|Add0~49_sumout\,
	cout => \inst|Add0~50\);

-- Location: FF_X4_Y1_N11
\inst|counter_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~49_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(14));

-- Location: LABCELL_X4_Y1_N12
\inst|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~45_sumout\ = SUM(( \inst|counter_out\(15) ) + ( GND ) + ( \inst|Add0~50\ ))
-- \inst|Add0~46\ = CARRY(( \inst|counter_out\(15) ) + ( GND ) + ( \inst|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(15),
	cin => \inst|Add0~50\,
	sumout => \inst|Add0~45_sumout\,
	cout => \inst|Add0~46\);

-- Location: FF_X4_Y1_N14
\inst|counter_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~45_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(15));

-- Location: LABCELL_X4_Y1_N15
\inst|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~41_sumout\ = SUM(( \inst|counter_out\(16) ) + ( GND ) + ( \inst|Add0~46\ ))
-- \inst|Add0~42\ = CARRY(( \inst|counter_out\(16) ) + ( GND ) + ( \inst|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(16),
	cin => \inst|Add0~46\,
	sumout => \inst|Add0~41_sumout\,
	cout => \inst|Add0~42\);

-- Location: FF_X4_Y1_N17
\inst|counter_out[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~41_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(16));

-- Location: LABCELL_X4_Y1_N18
\inst|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~37_sumout\ = SUM(( \inst|counter_out\(17) ) + ( GND ) + ( \inst|Add0~42\ ))
-- \inst|Add0~38\ = CARRY(( \inst|counter_out\(17) ) + ( GND ) + ( \inst|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(17),
	cin => \inst|Add0~42\,
	sumout => \inst|Add0~37_sumout\,
	cout => \inst|Add0~38\);

-- Location: FF_X4_Y1_N20
\inst|counter_out[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~37_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(17));

-- Location: LABCELL_X4_Y1_N21
\inst|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~33_sumout\ = SUM(( \inst|counter_out\(18) ) + ( GND ) + ( \inst|Add0~38\ ))
-- \inst|Add0~34\ = CARRY(( \inst|counter_out\(18) ) + ( GND ) + ( \inst|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(18),
	cin => \inst|Add0~38\,
	sumout => \inst|Add0~33_sumout\,
	cout => \inst|Add0~34\);

-- Location: FF_X4_Y1_N23
\inst|counter_out[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~33_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(18));

-- Location: LABCELL_X4_Y1_N24
\inst|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~29_sumout\ = SUM(( \inst|counter_out\(19) ) + ( GND ) + ( \inst|Add0~34\ ))
-- \inst|Add0~30\ = CARRY(( \inst|counter_out\(19) ) + ( GND ) + ( \inst|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(19),
	cin => \inst|Add0~34\,
	sumout => \inst|Add0~29_sumout\,
	cout => \inst|Add0~30\);

-- Location: FF_X4_Y1_N26
\inst|counter_out[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~29_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(19));

-- Location: LABCELL_X4_Y1_N27
\inst|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~25_sumout\ = SUM(( \inst|counter_out\(20) ) + ( GND ) + ( \inst|Add0~30\ ))
-- \inst|Add0~26\ = CARRY(( \inst|counter_out\(20) ) + ( GND ) + ( \inst|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(20),
	cin => \inst|Add0~30\,
	sumout => \inst|Add0~25_sumout\,
	cout => \inst|Add0~26\);

-- Location: FF_X4_Y1_N29
\inst|counter_out[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~25_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(20));

-- Location: LABCELL_X4_Y1_N30
\inst|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~21_sumout\ = SUM(( \inst|counter_out\(21) ) + ( GND ) + ( \inst|Add0~26\ ))
-- \inst|Add0~22\ = CARRY(( \inst|counter_out\(21) ) + ( GND ) + ( \inst|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(21),
	cin => \inst|Add0~26\,
	sumout => \inst|Add0~21_sumout\,
	cout => \inst|Add0~22\);

-- Location: FF_X4_Y1_N32
\inst|counter_out[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~21_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(21));

-- Location: LABCELL_X4_Y1_N33
\inst|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~17_sumout\ = SUM(( \inst|counter_out\(22) ) + ( GND ) + ( \inst|Add0~22\ ))
-- \inst|Add0~18\ = CARRY(( \inst|counter_out\(22) ) + ( GND ) + ( \inst|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(22),
	cin => \inst|Add0~22\,
	sumout => \inst|Add0~17_sumout\,
	cout => \inst|Add0~18\);

-- Location: FF_X4_Y1_N35
\inst|counter_out[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~17_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(22));

-- Location: LABCELL_X4_Y1_N36
\inst|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~13_sumout\ = SUM(( \inst|counter_out\(23) ) + ( GND ) + ( \inst|Add0~18\ ))
-- \inst|Add0~14\ = CARRY(( \inst|counter_out\(23) ) + ( GND ) + ( \inst|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(23),
	cin => \inst|Add0~18\,
	sumout => \inst|Add0~13_sumout\,
	cout => \inst|Add0~14\);

-- Location: FF_X4_Y1_N38
\inst|counter_out[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~13_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(23));

-- Location: LABCELL_X4_Y1_N39
\inst|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~5_sumout\ = SUM(( \inst|counter_out\(24) ) + ( GND ) + ( \inst|Add0~14\ ))
-- \inst|Add0~6\ = CARRY(( \inst|counter_out\(24) ) + ( GND ) + ( \inst|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(24),
	cin => \inst|Add0~14\,
	sumout => \inst|Add0~5_sumout\,
	cout => \inst|Add0~6\);

-- Location: FF_X4_Y1_N41
\inst|counter_out[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~5_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(24));

-- Location: LABCELL_X4_Y1_N42
\inst|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~9_sumout\ = SUM(( \inst|counter_out\(25) ) + ( GND ) + ( \inst|Add0~6\ ))
-- \inst|Add0~10\ = CARRY(( \inst|counter_out\(25) ) + ( GND ) + ( \inst|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(25),
	cin => \inst|Add0~6\,
	sumout => \inst|Add0~9_sumout\,
	cout => \inst|Add0~10\);

-- Location: FF_X4_Y1_N44
\inst|counter_out[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~9_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(25));

-- Location: LABCELL_X4_Y1_N45
\inst|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|Add0~1_sumout\ = SUM(( \inst|counter_out\(26) ) + ( GND ) + ( \inst|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \inst|ALT_INV_counter_out\(26),
	cin => \inst|Add0~10\,
	sumout => \inst|Add0~1_sumout\);

-- Location: FF_X4_Y1_N47
\inst|counter_out[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|pll_inst|altera_pll_i|outclk_wire[0]~CLKENA0_outclk\,
	d => \inst|Add0~1_sumout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|counter_out\(26));

-- Location: LABCELL_X4_Y1_N51
\inst2|LPM_MUX_component|auto_generated|l1_w3_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|LPM_MUX_component|auto_generated|l1_w3_n0_mux_dataout~0_combout\ = ( \inst|counter_out\(24) & ( (!\KEY[0]~input_o\) # (\inst|counter_out\(26)) ) ) # ( !\inst|counter_out\(24) & ( (\KEY[0]~input_o\ & \inst|counter_out\(26)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001111001111110011111100111111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_KEY[0]~input_o\,
	datac => \inst|ALT_INV_counter_out\(26),
	dataf => \inst|ALT_INV_counter_out\(24),
	combout => \inst2|LPM_MUX_component|auto_generated|l1_w3_n0_mux_dataout~0_combout\);

-- Location: LABCELL_X4_Y1_N54
\inst2|LPM_MUX_component|auto_generated|l1_w2_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|LPM_MUX_component|auto_generated|l1_w2_n0_mux_dataout~0_combout\ = ( \inst|counter_out\(25) & ( (\KEY[0]~input_o\) # (\inst|counter_out\(23)) ) ) # ( !\inst|counter_out\(25) & ( (\inst|counter_out\(23) & !\KEY[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100010001000100010001110111011101110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_counter_out\(23),
	datab => \ALT_INV_KEY[0]~input_o\,
	dataf => \inst|ALT_INV_counter_out\(25),
	combout => \inst2|LPM_MUX_component|auto_generated|l1_w2_n0_mux_dataout~0_combout\);

-- Location: LABCELL_X4_Y1_N48
\inst2|LPM_MUX_component|auto_generated|l1_w1_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|LPM_MUX_component|auto_generated|l1_w1_n0_mux_dataout~0_combout\ = ( \inst|counter_out\(24) & ( (\inst|counter_out\(22)) # (\KEY[0]~input_o\) ) ) # ( !\inst|counter_out\(24) & ( (!\KEY[0]~input_o\ & \inst|counter_out\(22)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000001100000011000000110000111111001111110011111100111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_KEY[0]~input_o\,
	datac => \inst|ALT_INV_counter_out\(22),
	dataf => \inst|ALT_INV_counter_out\(24),
	combout => \inst2|LPM_MUX_component|auto_generated|l1_w1_n0_mux_dataout~0_combout\);

-- Location: LABCELL_X4_Y1_N57
\inst2|LPM_MUX_component|auto_generated|l1_w0_n0_mux_dataout~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst2|LPM_MUX_component|auto_generated|l1_w0_n0_mux_dataout~0_combout\ = ( \inst|counter_out\(21) & ( (!\KEY[0]~input_o\) # (\inst|counter_out\(23)) ) ) # ( !\inst|counter_out\(21) & ( (\inst|counter_out\(23) & \KEY[0]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000111011101110111011101110111011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \inst|ALT_INV_counter_out\(23),
	datab => \ALT_INV_KEY[0]~input_o\,
	dataf => \inst|ALT_INV_counter_out\(21),
	combout => \inst2|LPM_MUX_component|auto_generated|l1_w0_n0_mux_dataout~0_combout\);

-- Location: MLABCELL_X34_Y53_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;


pll_reconfig_inst_tasks : altera_pll_reconfig_tasks
-- pragma translate_off
GENERIC MAP (
		number_of_fplls => 1);
-- pragma translate_on
END structure;


