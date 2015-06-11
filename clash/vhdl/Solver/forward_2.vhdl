-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity forward_2 is
  port(eta_i1   : in std_logic_vector(3 downto 0);
       eta_i2   : in product0;
       topLet_o : out product0);
end;

architecture structural of forward_2 is
  signal altLet_0 : product0;
  signal keys_1   : std_logic_vector(3 downto 0);
begin
  altLet_0 <= (product0_sel0 => keys_1
              ,product0_sel1 => eta_i1);
  
  keys_1 <= eta_i2.product0_sel0;
  
  topLet_o <= altLet_0;
end;
