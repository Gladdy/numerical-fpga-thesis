-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity blinker is
  port(KEY1     : in std_logic_vector(0 downto 0);
       KEY2     : in std_logic_vector(0 downto 0);
       CLOCK_50 : in std_logic_vector(0 downto 0);
       KEY0     : in std_logic_vector(0 downto 0);
       LED      : out std_logic_vector(7 downto 0));
end;

architecture structural of blinker is
  signal system1000      : std_logic;
  signal system1000_rstn : std_logic;
  signal clock_locked    : std_logic;
begin
  clock_inst : entity clock
    port map
      (CLOCK_50     => clk
      ,clock_stable => clock_locked);
  
  topEntity_0_inst : entity topEntity_0
    port map
      (key1_i1         => KEY1
      ,key2_i2         => KEY2
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,topLet_o        => LED);
end;
