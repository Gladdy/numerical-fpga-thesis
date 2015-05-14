library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compute_main IS
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
END compute_main;

ARCHITECTURE behaviour OF compute_main IS 

BEGIN
	PROCESS(clock)
	BEGIN
		IF rising_edge(clock) THEN
			leds_status <= keys_in;
		END IF;
	END PROCESS;
END;