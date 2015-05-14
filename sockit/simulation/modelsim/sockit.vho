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

-- DATE "05/14/2015 20:56:29"

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

ENTITY 	sockit IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	keys_in : IN std_logic_vector(3 DOWNTO 0);
	leds_out : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END sockit;

-- Design Ports Information
-- reset	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds_out[0]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds_out[1]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds_out[2]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- leds_out[3]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_K14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keys_in[0]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keys_in[1]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keys_in[2]	=>  Location: PIN_AD9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- keys_in[3]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF sockit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_keys_in : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_leds_out : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \keys_in[0]~input_o\ : std_logic;
SIGNAL \G1|leds_out[0]~0_combout\ : std_logic;
SIGNAL \keys_in[1]~input_o\ : std_logic;
SIGNAL \G1|leds_out[1]~1_combout\ : std_logic;
SIGNAL \keys_in[2]~input_o\ : std_logic;
SIGNAL \G1|leds_out[2]~2_combout\ : std_logic;
SIGNAL \keys_in[3]~input_o\ : std_logic;
SIGNAL \G1|leds_out[3]~3_combout\ : std_logic;
SIGNAL \G1|leds_out\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G3|leds_status\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \G3|ALT_INV_leds_status\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_keys_in <= keys_in;
leds_out <= ww_leds_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\G3|ALT_INV_leds_status\(3) <= NOT \G3|leds_status\(3);
\G3|ALT_INV_leds_status\(2) <= NOT \G3|leds_status\(2);
\G3|ALT_INV_leds_status\(1) <= NOT \G3|leds_status\(1);
\G3|ALT_INV_leds_status\(0) <= NOT \G3|leds_status\(0);

-- Location: IOOBUF_X4_Y0_N53
\leds_out[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|leds_out\(0),
	devoe => ww_devoe,
	o => ww_leds_out(0));

-- Location: IOOBUF_X4_Y0_N19
\leds_out[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|leds_out\(1),
	devoe => ww_devoe,
	o => ww_leds_out(1));

-- Location: IOOBUF_X4_Y0_N36
\leds_out[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|leds_out\(2),
	devoe => ww_devoe,
	o => ww_leds_out(2));

-- Location: IOOBUF_X6_Y0_N2
\leds_out[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \G1|leds_out\(3),
	devoe => ww_devoe,
	o => ww_leds_out(3));

-- Location: IOIBUF_X32_Y81_N1
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G12
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X2_Y0_N92
\keys_in[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keys_in(0),
	o => \keys_in[0]~input_o\);

-- Location: FF_X2_Y2_N10
\G3|leds_status[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \keys_in[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G3|leds_status\(0));

-- Location: LABCELL_X2_Y2_N6
\G1|leds_out[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \G1|leds_out[0]~0_combout\ = ( !\G3|leds_status\(0) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \G3|ALT_INV_leds_status\(0),
	combout => \G1|leds_out[0]~0_combout\);

-- Location: FF_X2_Y2_N7
\G1|leds_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \G1|leds_out[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|leds_out\(0));

-- Location: IOIBUF_X2_Y0_N58
\keys_in[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keys_in(1),
	o => \keys_in[1]~input_o\);

-- Location: FF_X2_Y1_N58
\G3|leds_status[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \keys_in[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G3|leds_status\(1));

-- Location: LABCELL_X2_Y1_N54
\G1|leds_out[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \G1|leds_out[1]~1_combout\ = ( !\G3|leds_status\(1) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \G3|ALT_INV_leds_status\(1),
	combout => \G1|leds_out[1]~1_combout\);

-- Location: FF_X2_Y1_N55
\G1|leds_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \G1|leds_out[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|leds_out\(1));

-- Location: IOIBUF_X2_Y0_N75
\keys_in[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keys_in(2),
	o => \keys_in[2]~input_o\);

-- Location: FF_X2_Y2_N58
\G3|leds_status[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \keys_in[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G3|leds_status\(2));

-- Location: LABCELL_X2_Y2_N54
\G1|leds_out[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \G1|leds_out[2]~2_combout\ = ( !\G3|leds_status\(2) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \G3|ALT_INV_leds_status\(2),
	combout => \G1|leds_out[2]~2_combout\);

-- Location: FF_X2_Y2_N55
\G1|leds_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \G1|leds_out[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|leds_out\(2));

-- Location: IOIBUF_X2_Y0_N41
\keys_in[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_keys_in(3),
	o => \keys_in[3]~input_o\);

-- Location: FF_X2_Y2_N28
\G3|leds_status[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	asdata => \keys_in[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G3|leds_status\(3));

-- Location: LABCELL_X2_Y2_N24
\G1|leds_out[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \G1|leds_out[3]~3_combout\ = ( !\G3|leds_status\(3) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \G3|ALT_INV_leds_status\(3),
	combout => \G1|leds_out[3]~3_combout\);

-- Location: FF_X2_Y2_N25
\G1|leds_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \G1|leds_out[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \G1|leds_out\(3));

-- Location: IOIBUF_X18_Y81_N75
\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: LABCELL_X37_Y76_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


