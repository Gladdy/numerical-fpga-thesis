-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_satMult_16 is
  port(pTS_i1   : in signed(31 downto 0);
       topLet_o : out signed(31 downto 0));
end;

architecture structural of Solver_satMult_16 is
  signal repANF_0 : signed(63 downto 0);
begin
  Solver_a_17_repANF_0 : entity Solver_a_17
    port map
      (topLet_o => repANF_0
      ,pTS_i1   => pTS_i1);
  
  Solver_resizeFzm_5_topLet_o : entity Solver_resizeFzm_5
    port map
      (bodyVar_o => topLet_o
      ,eta_i1    => repANF_0);
end;
