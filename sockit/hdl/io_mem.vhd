library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY io_mem IS
	PORT(	
		-- Basic signals
		clock : in std_logic;
		reset : in std_logic;
		
		-- INTERNAL SIGNALS
		input_data : in std_logic_vector(127 downto 0);
		input_set : in std_logic;
		
		output_data : out std_logic_vector(127 downto 0);
		output_set : out std_logic;
		output_waitrequest : in std_logic;
		
		control_data : in std_logic_vector(31 downto 0);
		control_set : in std_logic;
		
		
		-- EXPOSED / EXPORTED SIGNALS
		input_data_export : out std_logic_vector(127 downto 0);
		input_set_export : out std_logic;
		
		output_data_export : in std_logic_vector(127 downto 0);
		output_set_export : in std_logic;
		output_waitrequest_export : out std_logic;
		
		control_data_export : out std_logic_vector(31 downto 0);
		control_set_export : out std_logic
	);
END io_mem;

ARCHITECTURE behaviour OF io_mem IS 

BEGIN
	PROCESS(clock)
	BEGIN
		IF rising_edge(clock) THEN
			--Data input
			input_data_export <= input_data;
			input_set_export <= input_set;
			
			--Data output
			output_data <= output_data_export;
			output_set <= output_set_export;
			output_waitrequest_export <= output_waitrequest;
			
			--Control input
			control_data_export <= control_data;
			control_set_export <= control_set;			
		END IF;
	END PROCESS;
END;