-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity blinkerT_4 is
  port(ds_i1    : in product0;
       key1R_i2 : in boolean;
       topLet_o : out product1);
end;

architecture structural of blinkerT_4 is
  signal altLet_0       : std_logic_vector(7 downto 0);
  signal altLet_1       : std_logic_vector(7 downto 0);
  signal subjLet_2      : boolean;
  signal altLet_3       : std_logic_vector(7 downto 0);
  signal wild1_4        : integer;
  signal bodyVar_5      : std_logic_vector(7 downto 0);
  signal altLet_6       : boolean;
  signal repANF_7       : boolean;
  signal subjLet_8      : boolean;
  signal altLet_9       : integer;
  signal wild1_10       : integer;
  signal bodyVar_11     : integer;
  signal repANF_12      : product0;
  signal altLet_13      : product1;
  signal leds_14        : std_logic_vector(7 downto 0);
  signal mode_15        : boolean;
  signal cntr_16        : integer;
  signal tmp_tte_rhs_19 : integer;
  signal tmp_tte_19     : boolean;
  signal tmp_20         : integer;
  signal tmp_tte_rhs_22 : integer;
  signal tmp_tte_22     : boolean;
  signal tmp_24         : integer;
begin
  altLet_0 <= std_logic_vector(rotate_left(unsigned(leds_14),1));
  
  altLet_1 <= not leds_14;
  
  tmp_tte_rhs_19 <= wild1_4;
  
  tmp_tte_19 <= false when tmp_tte_rhs_19 = 0 else true;
  
  subjLet_2 <= tmp_tte_19;
  
  with (mode_15) select
    altLet_3 <= altLet_1 when (true),
                altLet_0 when others;
  
  tmp_20 <= 1 when cntr_16 = 0 else 0;
  
  wild1_4 <= tmp_20;
  
  with (subjLet_2) select
    bodyVar_5 <= altLet_3 when (true),
                 leds_14 when others;
  
  altLet_6 <= not mode_15;
  
  with (key1R_i2) select
    repANF_7 <= altLet_6 when (true),
                mode_15 when others;
  
  tmp_tte_rhs_22 <= wild1_10;
  
  tmp_tte_22 <= false when tmp_tte_rhs_22 = 0 else true;
  
  subjLet_8 <= tmp_tte_22;
  
  altLet_9 <= cntr_16 + 1;
  
  tmp_24 <= 1 when cntr_16 = 16650000 else 0;
  
  wild1_10 <= tmp_24;
  
  with (subjLet_8) select
    bodyVar_11 <= 0 when (true),
                  altLet_9 when others;
  
  repANF_12 <= (product0_sel0 => bodyVar_5
               ,product0_sel1 => repANF_7
               ,product0_sel2 => bodyVar_11);
  
  altLet_13 <= (product1_sel0 => repANF_12
               ,product1_sel1 => leds_14);
  
  leds_14 <= ds_i1.product0_sel0;
  
  mode_15 <= ds_i1.product0_sel1;
  
  cntr_16 <= ds_i1.product0_sel2;
  
  topLet_o <= altLet_13;
end;
