library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY io_led IS
	PORT(	
		clock : in std_logic;
		reset : in std_logic;
		leds_status : in std_logic_vector(3 downto 0);
		leds_out : out std_logic_vector(3 downto 0)
	);
END io_led;

ARCHITECTURE behaviour OF io_led IS
	
BEGIN
	PROCESS(clock)
	BEGIN
		IF rising_edge(clock) THEN
			leds_out <= not(leds_status);
		END IF;
	END PROCESS;
END;