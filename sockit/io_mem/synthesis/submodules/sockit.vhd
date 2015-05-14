library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit IS
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
	
	SIGNAL leds_status 	: std_logic_vector(3 downto 0);	

BEGIN
	G1 : io_led 		PORT MAP (clock, reset, leds_status, leds_out);
	G2 : compute_main PORT MAP (clock, reset, input_data, input_set, output_data, output_set, output_waitrequest, control_data, control_set, keys_in, leds_status);
	
END behaviour;