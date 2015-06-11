-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity addition_2 is
  port(init_i1  : in std_logic_vector(3 downto 0);
       ds_i2    : in product0;
       topLet_o : out product0);
end;

architecture structural of addition_2 is
  signal repANF_0 : std_logic_vector(3 downto 0);
  signal repANF_1 : std_logic_vector(3 downto 0);
  signal altLet_2 : product0;
  signal i_3      : std_logic_vector(3 downto 0);
  signal j_4      : std_logic_vector(3 downto 0);
begin
  repANF_0 <= std_logic_vector(resize(unsigned(i_3) * unsigned(j_4), 4));
  
  repANF_1 <= std_logic_vector(unsigned(init_i1) + unsigned(repANF_0));
  
  altLet_2 <= (product0_sel0 => repANF_1
              ,product0_sel1 => init_i1);
  
  i_3 <= ds_i2.product0_sel0;
  
  j_4 <= ds_i2.product0_sel1;
  
  topLet_o <= altLet_2;
end;
