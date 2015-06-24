-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_zdfFractionalFixed_zdcfromRational21_8 is
  port(pTS_i1   : in signed(63 downto 0);
       topLet_o : out boolean);
end;

architecture structural of Solver_zdfFractionalFixed_zdcfromRational21_8 is
begin
  topLet_o <= pTS_i1 >= signed'("0000000000000000000000000000000000000000000000000000000000000000");
end;
