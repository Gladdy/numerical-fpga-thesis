-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity topEntity_0 is
  port(key1_i1         : in std_logic_vector(0 downto 0);
       key2_i2         : in std_logic_vector(0 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       topLet_o        : out std_logic_vector(7 downto 0));
end;

architecture structural of topEntity_0 is
  signal repANF_0 : boolean;
begin
  zdwisRisingzm_1_repANF_0 : entity zdwisRisingzm_1
    port map
      (bodyVar_o       => repANF_0
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => key1_i1);
  
  mealyzm_3_topLet_o : entity mealyzm_3
    port map
      (bodyVar_o       => topLet_o
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => repANF_0);
end;
