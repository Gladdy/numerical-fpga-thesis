-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity mealyzm_1 is
  port(eta_i1         : in product0;
       system1000     : in std_logic;
       system1000_rst : in std_logic;
       bodyVar_o      : out signed(8 downto 0));
end;

architecture structural of mealyzm_1 is
  signal o1_0      : signed(8 downto 0);
  signal bodyVar_1 : product0;
  signal x_2       : product0;
begin
  bodyVar_o <= o1_0;
  
  o1_0 <= bodyVar_1.product0_sel1;
  
  BundleZ2T1_2_bodyVar_1 : entity BundleZ2T1_2
    port map
      (topLet_o => bodyVar_1
      ,eta_i1   => x_2);
  
  zuzpzf_3_x_2 : entity zuzpzf_3
    port map
      (topLet_o       => x_2
      ,system1000     => system1000
      ,system1000_rst => system1000_rst
      ,ds_i1          => bodyVar_1
      ,eta_i2         => eta_i1);
end;
