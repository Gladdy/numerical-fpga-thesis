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
		leds_status 			: out std_logic_vector(3 downto 0)
	);
END compute_main;

ARCHITECTURE behaviour OF compute_main IS 

BEGIN
	PROCESS(clock)
		VARIABLE keys : std_logic_vector(3 downto 0);
		VARIABLE switches : std_logic_vector(3 downto 0);

		VARIABLE control : std_logic_vector(3 downto 0) := "0000";
		VARIABLE input : std_logic_vector(3 downto 0) := "0000";
		VARIABLE trigger : std_logic_vector(3 downto 0) := "0000";
	BEGIN
	
		keys := not(keys_input);
		switches := not(switches_input);
	
		trigger(0) := control_set;
		trigger(1) := input_set;
		trigger(2) := output_set;
		trigger(3) := output_waitrequest;
			
		IF rising_edge(clock) THEN
			
			--Control the output
			IF switches(0) THEN
				leds_status <= control;
			ELSIF switches(1) THEN
				leds_status <= input;
			ELSE
				leds_status <= trigger;
			END IF;
			
			--Detect changes in the input
			IF control_set THEN
				control := control_data(3 downto 0);
			END IF;
			
			IF input_set THEN
				input := input_data(3 downto 0);
			END IF;
			
		END IF;
	END PROCESS;
END;