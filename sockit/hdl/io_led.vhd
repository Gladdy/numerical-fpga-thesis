library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY io_led IS
	PORT(	
		CLOCK_50 : in std_logic;
		RESET : in std_logic;
		leds_status : in std_logic_vector(3 downto 0);
		LED : out std_logic_vector(3 downto 0)
	);
END io_led;

ARCHITECTURE behaviour OF io_led IS
	
BEGIN
	PROCESS(CLOCK_50)
	BEGIN
		IF rising_edge(CLOCK_50) THEN
			LED <= not(leds_status);
		END IF;
	END PROCESS;
END;