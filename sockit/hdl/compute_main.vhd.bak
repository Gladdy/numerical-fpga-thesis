library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compute_main IS
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
END compute_main;

ARCHITECTURE behaviour OF compute_main IS 

BEGIN
	PROCESS(CLOCK_50)
	BEGIN
		IF rising_edge(CLOCK_50) THEN
			leds_status <= KEY;
		END IF;
	END PROCESS;
END;