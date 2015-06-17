-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_mealyzm_1 is
  port(eta_i1          : in product0;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out product1);
end;

architecture structural of Solver_mealyzm_1 is
  signal y_0       : product1;
  signal bodyVar_1 : product3;
  signal x_2       : product2;
  signal repANF_3  : product2;
  signal x_4       : product2;
  signal tmp_5     : product2;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product3_sel1;
  
  Solver_forwardLEDS_2_bodyVar_1 : entity Solver_forwardLEDS_2
    port map
      (topLet_o => bodyVar_1
      ,ds1_i1   => x_2
      ,input_i2 => eta_i1);
  
  register_Solver_mealyzm_1_n_20 : block
    signal n_21 : product2;
    signal n_22 : product2;
  begin
    n_21 <= (product2_sel0 => (product4_sel0 => (product7_sel0 => array_of_unsigned_32'(0 to (256)-1 => unsigned'("00000000000000000000000000000000")),product7_sel1 => unsigned'("00000000000000000000000000000000")),product4_sel1 => unsigned'("00000000000000000000000000000000"),product4_sel2 => unsigned'("11111111111111111111111111111111")),product2_sel1 => (product5_sel0 => unsigned'("00000000000000000000001111101000"),product5_sel1 => unsigned'("00000000000000000000000000000001"),product5_sel2 => unsigned'("00000000000000000000000000000001"),product5_sel3 => array_of_unsigned_32'(0 to (256)-1 => unsigned'("00000000000000000000000000000000"))),product2_sel2 => std_logic_vector'("00000000000000000000000000000000"),product2_sel3 => std_logic_vector'("1"));
  
    process(system1000,system1000_rstn,n_21)
    begin
      if system1000_rstn = '0' then
        n_22 <= n_21;
      elsif rising_edge(system1000) then
        n_22 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_22;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product3_sel0;
end;
