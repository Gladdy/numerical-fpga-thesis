-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_forwardLEDS14_3 is
  port(ds1_i1   : in unsigned(31 downto 0);
       topLet_o : out unsigned(31 downto 0));
end;

architecture structural of Solver_forwardLEDS14_3 is
begin
  topLet_o <= resize(ds1_i1 * unsigned'("00000000000000000000000000000010"), 32);
end;
