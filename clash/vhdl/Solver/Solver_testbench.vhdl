-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_testbench is
  port(done : out boolean);
end;

architecture structural of Solver_testbench is
  signal finished        : boolean;
  signal system1000      : std_logic;
  signal system1000_rstn : std_logic;
  signal w3_i1           : product0;
  signal topLet_o        : product1;
begin
  done <= finished;
  
  -- pragma translate_off
  process is
  begin
    system1000 <= '0';
    wait for 2 ns;
    while (not finished) loop
      system1000 <= not system1000;
      wait for 500 ns;
      system1000 <= not system1000;
      wait for 500 ns;
    end loop;
    wait;
  end process;
  -- pragma translate_on
  
  -- pragma translate_off
  system1000_rstn <= '0',
             '1' after 1 ns;
  -- pragma translate_on
  
  totest : entity Solver_topEntity_0
    port map
      (system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,w3_i1           => w3_i1
      ,topLet_o        => topLet_o);
  
  w3_i1 <= ((others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'),(others => 'X'));
  
  finished <=
  -- pragma translate_off
              false,
  -- pragma translate_on
              true
  -- pragma translate_off
              after 100 ns
  -- pragma translate_on
              ;
end;
