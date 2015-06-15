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
      ,eta_i1   => x_2
      ,eta_i2   => eta_i1);
  
  register_Solver_mealyzm_1_n_12 : block
    signal n_13 : product2;
    signal n_14 : product2;
  begin
    n_13 <= (product2_sel0 => (product4_sel0 => array_of_std_logic_vector_32'(0 to (5)-1 => std_logic_vector'("00000000000000000000000000000101")),product4_sel1 => std_logic_vector'("00000000000000000000000000000000"),product4_sel2 => std_logic_vector'("00000000000000000000000000000000"),product4_sel3 => std_logic_vector'("1")),product2_sel1 => 0);
  
    process(system1000,system1000_rstn,n_13)
    begin
      if system1000_rstn = '0' then
        n_14 <= n_13;
      elsif rising_edge(system1000) then
        n_14 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_14;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product3_sel0;
end;
