library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY data_output IS
    PORT(   
        -- Basic signals
        clock : in std_logic;
        reset : in std_logic;
        
        -- Avalon signals
        as_read : in std_logic;
        as_readdata : out std_logic_vector(31 downto 0);
        as_address : in std_logic_vector(7 downto 0);

        -- Exported signals
        data_out_read : out std_logic;
        data_out_readdata : in std_logic_vector(31 downto 0);
        data_out_address : out std_logic_vector(7 downto 0)
    );
END data_output;

ARCHITECTURE behaviour OF data_output IS 

BEGIN
    PROCESS(clock)
    BEGIN
        IF rising_edge(clock) THEN
            --Data output
            as_readdata <= data_out_readdata;
            data_out_address <= as_address;
            data_out_read <= as_read;        
        END IF;
    END PROCESS;
END;
