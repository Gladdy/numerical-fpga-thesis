-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_forwardLEDS_2 is
  port(eta_i1   : in integer;
       eta_i2   : in product0;
       topLet_o : out product2);
end;

architecture structural of Solver_forwardLEDS_2 is
  signal repANF_0 : product1;
  signal repANF_1 : std_logic_vector(3 downto 0);
  signal ds1_2    : std_logic_vector(3 downto 0);
begin
  repANF_0 <= (product1_sel0 => repANF_1
              ,product1_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product1_sel2 => std_logic_vector'("00000000000000000000000000000000"));
  
  repANF_1 <= ds1_2;
  
  ds1_2 <= eta_i2.product0_sel1;
  
  topLet_o <= (product2_sel0 => eta_i1
              ,product2_sel1 => repANF_0);
end;
