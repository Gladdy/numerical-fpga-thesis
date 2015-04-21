-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity macT_4 is
  port(acc_i1   : in signed(8 downto 0);
       ds_i2    : in product0;
       topLet_o : out product0);
end;

architecture structural of macT_4 is
  signal repANF_0 : signed(8 downto 0);
  signal repANF_1 : signed(8 downto 0);
  signal altLet_2 : product0;
  signal x_3      : signed(8 downto 0);
  signal y_4      : signed(8 downto 0);
begin
  repANF_0 <= resize(x_3 * y_4, 9);
  
  repANF_1 <= acc_i1 + repANF_0;
  
  altLet_2 <= (product0_sel0 => repANF_1
              ,product0_sel1 => acc_i1);
  
  x_3 <= ds_i2.product0_sel0;
  
  y_4 <= ds_i2.product0_sel1;
  
  topLet_o <= altLet_2;
end;
