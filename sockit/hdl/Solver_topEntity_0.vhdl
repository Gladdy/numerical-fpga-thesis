-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_topEntity_0 is
  port(w3_i1           : in product0;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       topLet_o        : out product1);
end;

architecture structural of Solver_topEntity_0 is
  signal tmp_17 : product6;
begin
  tmp_17 <= (product6_sel0 => (product8_sel0 => (product3_sel0 => array_of_signed_32'(0 to (5)-1 => (shift_left(signed'("00000000000000000000000000000000"),24)))
                                                ,product3_sel1 => shift_left(signed'("00000000000000000000000000000000"),24))
                              ,product8_sel1 => unsigned'("11111111111111111111111111111111"))
            ,product6_sel1 => (product9_sel0 => shift_left(signed'("00000000000000000000000001111101"),24)
                              ,product9_sel1 => signed'("00000000000000101000111101011100")
                              ,product9_sel2 => unsigned'("00000000000000000000000000000101")
                              ,product9_sel3 => array_of_signed_32'(0 to (20)-1 => (shift_left(signed'("00000000000000000000000000000000"),24))))
            ,product6_sel2 => std_logic_vector'("00000000000000000000000000000000")
            ,product6_sel3 => std_logic_vector'("1"));
  
  Solver_mealyzm_1_topLet_o : entity Solver_mealyzm_1
    port map
      (bodyVar_o       => topLet_o
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,eta_i1          => tmp_17
      ,eta_i2          => w3_i1);
end;
