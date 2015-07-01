library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY sockit_pll IS
  PORT( 
    clock     : in std_logic;
    reset     : in std_logic;
    clock_pll : out std_logic
  );
END sockit_pll;

ARCHITECTURE behaviour OF sockit_pll IS
  SIGNAL clock_internal : std_logic := '0';
BEGIN
  PROCESS(clock, reset)
      VARIABLE counter : integer range 0 to 15 := 0;
  BEGIN
    --IF(reset = '0') THEN
    --  clock_internal <= '0';
    --  counter := 0;
    --ELSIF rising_edge(clock) THEN
    --  IF (counter = 6) THEN
    --    clock_internal <= NOT(clock_internal);
    --    counter := 0; 
    --  ELSE
    --    counter := counter + 1;
    --  END IF;
    --END IF;
    --clock_pll <= clock_internal;
  
    clock_pll <= clock;
  END PROCESS;

END;