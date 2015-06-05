library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY compute_main IS
PORT(
	clock 					: in std_logic;
	reset 					: in std_logic;
	
	control_writedata 	: in   	std_logic_vector(31 downto 0);                    -- writedata
	control_readdata  	: out		std_logic_vector(31 downto 0);
	control_address   	: in   	std_logic_vector(7 downto 0);                     -- address
	control_read      	: in   	std_logic;                                        -- read
	control_write     	: in   	std_logic;                                        -- write
	
	in_write          	: in   	std_logic;                                        -- write
	in_writedata      	: in   	std_logic_vector(31 downto 0);                    -- writedata
	in_address        	: in   	std_logic_vector(7 downto 0);                     -- address
	
	out_readdata      	: out    std_logic_vector(31 downto 0);
	out_address       	: in   	std_logic_vector(7 downto 0);                     -- address
	
	keys_input 				: in 	std_logic_vector(3 downto 0);
	switches_input			: in 	std_logic_vector(3 downto 0);
	leds_status 			: out std_logic_vector(3 downto 0);
	
	gp_input     			: out std_logic_vector(31 downto 0); 							-- gp_in (as seen from the HPS)
	gp_output    			: in  std_logic_vector(31 downto 0)                      -- gp_out (as seen from the HPS)
	);
END compute_main;

ARCHITECTURE behaviour OF compute_main IS 

BEGIN
	PROCESS(clock)
	
		VARIABLE trigger 	: std_logic_vector(3 downto 0)  := (others => '0');
		VARIABLE control 	: std_logic_vector(31 downto 0) := (others => '0');
		VARIABLE data 		: std_logic_vector(31 downto 0) := (others => '0');

		BEGIN
	
		IF rising_edge(clock) THEN
	
			trigger(0) := control_read;
			trigger(1) := control_write;
			trigger(2) := in_write;
			trigger(3) := reset;
			
			--Control the physical output
			CASE switches_input IS
				WHEN "1000" => leds_status <= control(3 downto 0);
				WHEN "0100" => leds_status <= in_writedata(3 downto 0);
				WHEN "0010" => leds_status <= trigger;
				WHEN "0001" => leds_status <= gp_output(3 downto 0);
				WHEN others => leds_status <= "1010";
			END CASE;
						
			--Always set the input_gp
			gp_input <= "10101010101010101010101010101010";
			
			--Latch for control signal
			IF control_write THEN
				control := control_writedata;
			END IF;
			
			--if control_read THEN
			control_readdata <= control;
			--END IF;
			
			--Latch for data signal
			IF in_write THEN
				data := in_writedata;
			END IF;
			
			out_readdata <= data;
			
		END IF;
	END PROCESS;
END;