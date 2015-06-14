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
  signal bodyVar_1 : product2;
  signal x_2       : integer;
  signal repANF_3  : integer;
  signal x_4       : integer;
  signal tmp_5     : integer;
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product2_sel1;
  
  Solver_forwardLEDS_2_bodyVar_1 : entity Solver_forwardLEDS_2
    port map
      (topLet_o => bodyVar_1
      ,eta_i1   => x_2
      ,eta_i2   => eta_i1);
  
  register_Solver_mealyzm_1_n_6 : block
    signal n_7 : integer;
    signal n_8 : integer;
  begin
    n_7 <= 0;
  
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
  
  x_4 <= bodyVar_1.product2_sel0;
end;
