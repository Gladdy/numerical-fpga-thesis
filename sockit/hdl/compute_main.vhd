library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compute_main IS
	PORT(	
		clock 					: in std_logic;
		reset 					: in std_logic;	
		input_data 				: in std_logic_vector(127 downto 0);
		input_set 				: in std_logic;
		output_data 			: out std_logic_vector(127 downto 0);
		output_set 				: out std_logic;
		output_waitrequest 	: in std_logic;
		control_data 			: in std_logic_vector(31 downto 0);
		control_set 			: in std_logic;
		keys_input 				: in std_logic_vector(3 downto 0);
		switches_input			: in std_logic_vector(3 downto 0);
		leds_status 			: out std_logic_vector(3 downto 0);
		input_gp     			: in    std_logic_vector(31 downto 0); -- gp_in
		output_gp    			: out   std_logic_vector(31 downto 0)                      -- gp_out
	);
END compute_main;

ARCHITECTURE behaviour OF compute_main IS 

BEGIN
	PROCESS(clock)
		VARIABLE keys 		: std_logic_vector(3 downto 0);
		VARIABLE control 	: std_logic_vector(3 downto 0) := "0000";
		VARIABLE input 	: std_logic_vector(3 downto 0) := "0000";
		VARIABLE trigger 	: std_logic_vector(3 downto 0) := "0000";
		VARIABLE gpinput 	: std_logic_vector(3 downto 0) := "0000";
		
	BEGIN
	
	
		IF rising_edge(clock) THEN

			keys := not(keys_input);		
			trigger(0) := control_set;
			trigger(1) := input_set;
			trigger(2) := output_set;
			trigger(3) := output_waitrequest;
			
			--Control the physical output
			CASE switches_input IS
				WHEN "1000" => leds_status <= control;
				WHEN "0100" => leds_status <= input;
				WHEN "0010" => leds_status <= trigger;
				WHEN "0001" => leds_status <= gpinput;
				WHEN others => leds_status <= "1010";
			END CASE;
						
			--Always set the output_gp
			output_gp <= "10101010101010101010101010101010";
			
			--Detect changes in the LWH2F
			IF control_set THEN
				control := control_data(3 downto 0);
			END IF;
			
			--Detect changes in the H2F and forward it to the the F2H
			IF input_set THEN
				input := input_data(3 downto 0);
			
				--Send the input straight to the output
				output_set <= '1';
				output_data <= input_data;
			ELSE
				output_set <= '0';
			END IF;
			
		END IF;
	END PROCESS;
END;