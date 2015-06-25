-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_mealyzm_1 is
  port(eta_i1          : in product7;
       eta_i2          : in product0;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out product1);
end;

architecture structural of Solver_mealyzm_1 is
  signal y_0       : product1;
  signal bodyVar_1 : product8;
  signal x_2       : product7;
  signal repANF_3  : product7;
  signal x_4       : product7;
  signal tmp_5     : product7;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product8_sel1;
  
  Solver_solveODE_2_bodyVar_1 : entity Solver_solveODE_2
    port map
      (topLet_o => bodyVar_1
      ,ds1_i1   => x_2
      ,input_i2 => eta_i2);
  
  register_Solver_mealyzm_1_n_6 : block
    signal n_7 : product7;
    signal n_8 : product7;
  begin
    n_7 <= eta_i1;
  
    process(system1000,system1000_rstn,n_7)
    begin
      if system1000_rstn = '0' then
        n_8 <= n_7;
      elsif rising_edge(system1000) then
        n_8 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_8;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product8_sel0;
end;
