library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY io_mem IS
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
END io_mem;

ARCHITECTURE behaviour OF io_mem IS
	
	SIGNAL internal_buffer : std_logic_vector(127 downto 0);
	
BEGIN
	PROCESS(clock)
	BEGIN
		IF rising_edge(clock) THEN
			if write_set then
				write_data <= internal_buffer;
			elsif read_set then
				internal_buffer <= read_data;
			end if;
		END IF;
	END PROCESS;
END;