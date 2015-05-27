-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity mealyzm_3 is
  port(eta_i1          : in boolean;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out std_logic_vector(7 downto 0));
end;

architecture structural of mealyzm_3 is
  signal y_0       : std_logic_vector(7 downto 0);
  signal bodyVar_1 : product1;
  signal x_2       : product0;
  signal repANF_3  : product0;
  signal x_4       : product0;
  signal tmp_5     : product0;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product1_sel1;
  
  blinkerT_4_bodyVar_1 : entity blinkerT_4
    port map
      (topLet_o => bodyVar_1
      ,ds_i1    => x_2
      ,key1R_i2 => eta_i1);
  
  register_mealyzm_3_n_7 : block
    signal n_8 : product0;
    signal n_9 : product0;
  begin
    n_8 <= (product0_sel0 => std_logic_vector'("00000001"),product0_sel1 => false,product0_sel2 => 0);
  
    process(system1000,system1000_rstn,n_8)
    begin
      if system1000_rstn = '0' then
        n_9 <= n_8;
      elsif rising_edge(system1000) then
        n_9 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_9;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product1_sel0;
end;
