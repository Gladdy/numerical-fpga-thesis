-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_rk2_3 is
  port(pTS_i1    : in product5;
       eta_i2    : in product7;
       bodyVar_o : out product7);
end;

architecture structural of Solver_rk2_3 is
  signal repANF_0   : array_of_signed_32(0 to 3);
  signal repANF_1   : array_of_signed_32(0 to 3);
  signal ds5_2      : array_of_signed_32(0 to 12);
  signal repANF_3   : product7;
  signal repANF_4   : product8;
  signal repANF_5   : product8;
  signal s1_6       : array_of_signed_32(0 to 3);
  signal repANF_7   : array_of_signed_32(0 to 3);
  signal ds7_8      : signed(31 downto 0);
  signal ds16_9     : array_of_signed_32(0 to 3);
  signal repANF_10  : array_of_signed_32(0 to 3);
  signal ds6_11     : signed(31 downto 0);
  signal ds3_12     : signed(31 downto 0);
  signal bodyVar_13 : array_of_signed_32(0 to 3);
  signal ds2_14     : signed(31 downto 0);
  signal repANF_15  : signed(31 downto 0);
  signal repANF_16  : array_of_signed_32(0 to 3);
  signal altLet_17  : product11;
  signal altLet_18  : product11;
  signal subjLet_19 : boolean;
  signal bodyVar_20 : product11;
  signal xszm_21    : signed(31 downto 0);
  signal xszm_22    : array_of_signed_32(0 to 3);
  signal tmp_23     : array_of_signed_32(0 to 3);
  signal tmp_31     : array_of_signed_32(0 to 3);
  signal tmp_40     : array_of_signed_32(0 to 3);
  signal tmp_50     : signed(31 downto 0);
  signal tmp_51     : array_of_signed_32(0 to 3);
  signal tmp_59     : array_of_signed_32(0 to 3);
begin
  map_n_25 : block
    signal n_26 : array_of_signed_32(0 to 3);
  begin
    n_26 <= s1_6;
  
    mapZ_n_27 : if tmp_23'length = 0 generate
      tmp_23 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_28 : if tmp_23'length /= 0 generate
      mapIter_n_29 : for n_30 in tmp_23'range generate
      begin
        Solver_specF_4_24 : entity Solver_specF_4
  port map
  (topLet_o => tmp_23(n_30)
  ,ds3_i1 => ds3_12
  ,ds6_i2 => n_26(n_30));
      end generate;
    end generate;
  end block;
  
  repANF_0 <= tmp_23;
  
  zipWith_n_33 : block
    signal n_34 : array_of_signed_32(0 to 3);
    signal n_35 : array_of_signed_32(0 to 3);
  begin
    n_34 <= ds16_9;
    n_35 <= repANF_0;
  
    zipWithZ_n_36 : if tmp_31'length = 0 generate
      tmp_31 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_37 : if tmp_31'length /= 0 generate
      zipWithIter_n_38 : for n_39 in tmp_31'range generate
      begin
        Solver_satPlus_10_32 : entity Solver_satPlus_10
  port map
  (bodyVar_o => tmp_31(n_39)
  ,eta_i1 => n_34(n_39)
  ,eta_i2 => n_35(n_39));
      end generate;
    end generate;
  end block;
  
  repANF_1 <= tmp_31;
  
  ds5_2 <= pTS_i1.product5_sel3;
  
  repANF_3 <= (product7_sel0 => repANF_1
              ,product7_sel1 => repANF_15);
  
  repANF_4 <= (product8_sel0 => eta_i2
              ,product8_sel1 => ds5_2);
  
  repANF_5 <= (product8_sel0 => repANF_3
              ,product8_sel1 => ds5_2);
  
  Solver_matrix3d_11_s1_6 : entity Solver_matrix3d_11
    port map
      (x_o   => s1_6
      ,ds_i1 => repANF_4);
  
  Solver_matrix3d_11_repANF_7 : entity Solver_matrix3d_11
    port map
      (x_o   => repANF_7
      ,ds_i1 => repANF_5);
  
  ds7_8 <= eta_i2.product7_sel1;
  
  ds16_9 <= eta_i2.product7_sel0;
  
  zipWith_n_42 : block
    signal n_43 : array_of_signed_32(0 to 3);
    signal n_44 : array_of_signed_32(0 to 3);
  begin
    n_43 <= s1_6;
    n_44 <= repANF_7;
  
    zipWithZ_n_45 : if tmp_40'length = 0 generate
      tmp_40 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_46 : if tmp_40'length /= 0 generate
      zipWithIter_n_47 : for n_48 in tmp_40'range generate
      begin
        Solver_satPlus_10_41 : entity Solver_satPlus_10
  port map
  (bodyVar_o => tmp_40(n_48)
  ,eta_i1 => n_43(n_48)
  ,eta_i2 => n_44(n_48));
      end generate;
    end generate;
  end block;
  
  repANF_10 <= tmp_40;
  
  tmp_50 <= signed'("00000000100000000000000000000000");
  
  Solver_satMult_5_ds6_11 : entity Solver_satMult_5
    port map
      (topLet_o => ds6_11
      ,eta_i1   => tmp_50
      ,eta_i2   => ds3_12);
  
  ds3_12 <= pTS_i1.product5_sel1;
  
  map_n_53 : block
    signal n_54 : array_of_signed_32(0 to 3);
  begin
    n_54 <= repANF_10;
  
    mapZ_n_55 : if tmp_51'length = 0 generate
      tmp_51 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_56 : if tmp_51'length /= 0 generate
      mapIter_n_57 : for n_58 in tmp_51'range generate
      begin
        Solver_specF_17_52 : entity Solver_specF_17
  port map
  (topLet_o => tmp_51(n_58)
  ,ds6_i1 => ds6_11
  ,ds7_i2 => n_54(n_58));
      end generate;
    end generate;
  end block;
  
  bodyVar_13 <= tmp_51;
  
  ds2_14 <= pTS_i1.product5_sel0;
  
  Solver_satPlus_10_repANF_15 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_15
      ,eta_i1    => ds7_8
      ,eta_i2    => ds3_12);
  
  zipWith_n_61 : block
    signal n_62 : array_of_signed_32(0 to 3);
    signal n_63 : array_of_signed_32(0 to 3);
  begin
    n_62 <= ds16_9;
    n_63 <= bodyVar_13;
  
    zipWithZ_n_64 : if tmp_59'length = 0 generate
      tmp_59 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_65 : if tmp_59'length /= 0 generate
      zipWithIter_n_66 : for n_67 in tmp_59'range generate
      begin
        Solver_satPlus_10_60 : entity Solver_satPlus_10
  port map
  (bodyVar_o => tmp_59(n_67)
  ,eta_i1 => n_62(n_67)
  ,eta_i2 => n_63(n_67));
      end generate;
    end generate;
  end block;
  
  repANF_16 <= tmp_59;
  
  altLet_17 <= (product11_sel0 => repANF_16
               ,product11_sel1 => repANF_15);
  
  altLet_18 <= (product11_sel0 => ds16_9
               ,product11_sel1 => ds7_8);
  
  subjLet_19 <= ds7_8 < ds2_14;
  
  with (subjLet_19) select
    bodyVar_20 <= altLet_17 when (true),
                  altLet_18 when others;
  
  xszm_21 <= bodyVar_20.product11_sel1;
  
  xszm_22 <= bodyVar_20.product11_sel0;
  
  bodyVar_o <= (product7_sel0 => xszm_22
               ,product7_sel1 => xszm_21);
end;
