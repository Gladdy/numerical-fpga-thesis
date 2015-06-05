library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY data_input IS
    PORT(   
        -- Basic signals
        clock : in std_logic;
        reset : in std_logic;
        
        -- Avalon signals
        as_write : in std_logic;
        as_writedata : in std_logic_vector(31 downto 0);
        as_address : in std_logic_vector(7 downto 0);

        -- Exported signals
        data_in_write : out std_logic;
        data_in_writedata : out std_logic_vector(31 downto 0);
        data_in_address : out std_logic_vector(7 downto 0)
    );
END data_input;

ARCHITECTURE behaviour OF data_input IS 

BEGIN
    PROCESS(clock)
    BEGIN
        IF rising_edge(clock) THEN
            --Data input
            data_in_write <= as_write;
            data_in_writedata <= as_writedata;
            data_in_address <= as_address;        
        END IF;
    END PROCESS;
END;
