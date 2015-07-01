-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_euler_3 is
  port(pTS_i1    : in product9;
       eta_i2    : in product3;
       bodyVar_o : out product3);
end;

architecture structural of Solver_euler_3 is
  signal ds5_0      : array_of_signed_32(0 to 19);
  signal repANF_1   : product2;
  signal repANF_2   : array_of_signed_32(0 to 4);
  signal ds7_3      : signed(31 downto 0);
  signal repANF_4   : array_of_signed_32(0 to 4);
  signal ds16_5     : array_of_signed_32(0 to 4);
  signal ds3_6      : signed(31 downto 0);
  signal altLet_7   : array_of_signed_32(0 to 4);
  signal ds2_8      : signed(31 downto 0);
  signal repANF_9   : signed(31 downto 0);
  signal altLet_10  : product10;
  signal altLet_11  : product10;
  signal subjLet_12 : boolean;
  signal bodyVar_13 : product10;
  signal xszm_14    : signed(31 downto 0);
  signal xszm_15    : array_of_signed_32(0 to 4);
  signal tmp_16     : array_of_signed_32(0 to 4);
  signal tmp_24     : array_of_signed_32(0 to 4);
begin
  ds5_0 <= pTS_i1.product9_sel3;
  
  repANF_1 <= (product2_sel0 => eta_i2
              ,product2_sel1 => ds5_0);
  
  Solver_matrix4d_4_repANF_2 : entity Solver_matrix4d_4
    port map
      (x_o   => repANF_2
      ,ds_i1 => repANF_1);
  
  ds7_3 <= eta_i2.product3_sel1;
  
  map_n_18 : block
    signal n_19 : array_of_signed_32(0 to 4);
  begin
    n_19 <= repANF_2;
  
    mapZ_n_20 : if tmp_16'length = 0 generate
      tmp_16 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_21 : if tmp_16'length /= 0 generate
      mapIter_n_22 : for n_23 in tmp_16'range generate
      begin
        Solver_specF_11_17 : entity Solver_specF_11
  port map
  (topLet_o => tmp_16(n_23)
  ,ds3_i1 => ds3_6
  ,ds8_i2 => n_19(n_23));
      end generate;
    end generate;
  end block;
  
  repANF_4 <= tmp_16;
  
  ds16_5 <= eta_i2.product3_sel0;
  
  ds3_6 <= pTS_i1.product9_sel1;
  
  zipWith_n_26 : block
    signal n_27 : array_of_signed_32(0 to 4);
    signal n_28 : array_of_signed_32(0 to 4);
  begin
    n_27 <= ds16_5;
    n_28 <= repANF_4;
  
    zipWithZ_n_29 : if tmp_24'length = 0 generate
      tmp_24 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_30 : if tmp_24'length /= 0 generate
      zipWithIter_n_31 : for n_32 in tmp_24'range generate
      begin
        Solver_satPlus_10_25 : entity Solver_satPlus_10
  port map
  (bodyVar_o => tmp_24(n_32)
  ,eta_i1 => n_27(n_32)
  ,eta_i2 => n_28(n_32));
      end generate;
    end generate;
  end block;
  
  altLet_7 <= tmp_24;
  
  ds2_8 <= pTS_i1.product9_sel0;
  
  Solver_satPlus_10_repANF_9 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_9
      ,eta_i1    => ds7_3
      ,eta_i2    => ds3_6);
  
  altLet_10 <= (product10_sel0 => altLet_7
               ,product10_sel1 => repANF_9);
  
  altLet_11 <= (product10_sel0 => ds16_5
               ,product10_sel1 => ds7_3);
  
  subjLet_12 <= ds7_3 < ds2_8;
  
  with (subjLet_12) select
    bodyVar_13 <= altLet_10 when (true),
                  altLet_11 when others;
  
  xszm_14 <= bodyVar_13.product10_sel1;
  
  xszm_15 <= bodyVar_13.product10_sel0;
  
  bodyVar_o <= (product3_sel0 => xszm_15
               ,product3_sel1 => xszm_14);
end;
