library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY data_control IS
    PORT(   
        -- Basic signals
        clock : in std_logic;
        reset : in std_logic;
        
        -- Avalon signals
        as_writedata : in std_logic_vector(31 downto 0);
        as_readdata : out std_logic_vector(31 downto 0);
        as_address : in std_logic_vector(7 downto 0);
        as_read : in std_logic;
        as_write : in std_logic;

        -- Exported signals
        control_writedata : out std_logic_vector(31 downto 0);
        control_readdata : in std_logic_vector(31 downto 0);
        control_address : out std_logic_vector(7 downto 0);
        control_read : out std_logic;
        control_write : out std_logic
    );
END data_control;

ARCHITECTURE behaviour OF data_control IS 

BEGIN
    PROCESS(clock)
    BEGIN
        IF rising_edge(clock) THEN
            control_writedata <= as_writedata;
            as_readdata <= control_readdata;
            control_address <= as_address;
            control_read <= as_read;
            control_write <= as_write;        
        END IF;
    END PROCESS;
END;
