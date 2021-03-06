-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_specF_11 is
  port(ds3_i1   : in signed(31 downto 0);
       ds8_i2   : in signed(31 downto 0);
       topLet_o : out signed(31 downto 0));
end;

architecture structural of Solver_specF_11 is
begin
  Solver_satMult_12_topLet_o : entity Solver_satMult_12
    port map
      (topLet_o => topLet_o
      ,eta_i1   => ds8_i2
      ,eta_i2   => ds3_i1);
end;
