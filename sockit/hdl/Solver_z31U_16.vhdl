-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_z31U_16 is
  port(pTS_i1   : in signed(63 downto 0);
       topLet_o : out signed(63 downto 0));
end;

architecture structural of Solver_z31U_16 is
begin
  topLet_o <= pTS_i1 and (not (resize((signed'(0 => '0', 1 to 32-1  => '1')),64)));
end;
