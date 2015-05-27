-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity zdwisRisingzm2_2 is
  port(old_i1   : in std_logic_vector(0 downto 0);
       new_i2   : in std_logic_vector(0 downto 0);
       topLet_o : out boolean);
end;

architecture structural of zdwisRisingzm2_2 is
  signal subjLet_0 : boolean;
  signal altLet_1  : boolean;
begin
  subjLet_0 <= old_i1 = (std_logic_vector'(1-1 downto 0 => '0'));
  
  altLet_1 <= new_i2 = (std_logic_vector'(1-1 downto 0 => '1'));
  
  with (subjLet_0) select
    topLet_o <= altLet_1 when (true),
                false when others;
end;
