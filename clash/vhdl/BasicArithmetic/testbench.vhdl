-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity testbench is
  port(done : out boolean);
end;

architecture structural of testbench is
  signal finished        : boolean;
  signal system1000      : std_logic;
  signal system1000_rstn : std_logic;
  signal eta_i1          : product0;
  signal topLet_o        : signed(8 downto 0);
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
  
  totest : entity topEntity_0
    port map
      (system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => eta_i1
      ,topLet_o        => topLet_o);
  
  eta_i1 <= ((others => 'X'),(others => 'X'));
  
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
