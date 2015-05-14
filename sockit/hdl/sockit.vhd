library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit IS
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
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
	
	COMPONENT io_mem
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
		write_data : out std_logic_vector(127 downto 0);
		write_set : in std_logic;
		read_data : in std_logic_vector(127 downto 0);
		read_set : in std_logic;
		control_data : in std_logic_vector(31 downto 0);
		control_set : in std_logic
	);
	END COMPONENT;
	
	COMPONENT compute_main
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
		write_data : out std_logic_vector(127 downto 0);
		write_set : in std_logic;
		read_data : in std_logic_vector(127 downto 0);
		read_set : in std_logic;
		control_data : in std_logic_vector(31 downto 0);
		control_set : in std_logic;
		leds_status : out std_logic_vector(3 downto 0);
		keys_in : in std_logic_vector(3 downto 0)
	);
	END COMPONENT;
	
	
	SIGNAL leds_status 	: std_logic_vector(3 downto 0);	
	SIGNAL write_data 	: std_logic_vector(127 downto 0);
	SIGNAL write_set 		: std_logic;
	SIGNAL read_data 		: std_logic_vector(127 downto 0);
	SIGNAL read_set 		: std_logic;
	SIGNAL control_data 	: std_logic_vector(31 downto 0);
	SIGNAL control_set 	: std_logic;

BEGIN
	G1 : io_led 		PORT MAP (clock, reset, leds_status, leds_out);
	G2 : io_mem 		PORT MAP (clock, reset, write_data, write_set, read_data, read_set, control_data, control_set);
	G3 : compute_main PORT MAP (clock, reset, write_data, write_set, read_data, read_set, control_data, control_set, leds_status, keys_in);
	
END behaviour;