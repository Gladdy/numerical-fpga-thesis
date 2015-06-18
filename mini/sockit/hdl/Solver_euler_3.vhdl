-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_euler_3 is
  port(pTS_i1    : in product5;
       eta_i2    : in product7;
       bodyVar_o : out product7);
end;

architecture structural of Solver_euler_3 is
  signal repANF_0  : signed(31 downto 0);
  signal altLet_1  : array_of_signed_32(0 to 15);
  signal ds1_2     : signed(31 downto 0);
  signal subjLet_3 : boolean;
  signal altLet_4  : array_of_signed_32(0 to 15);
  signal ds_5      : array_of_signed_32(0 to 15);
  signal repANF_6  : array_of_signed_32(0 to 15);
  signal ds2_7     : signed(31 downto 0);
  signal ds3_8     : signed(31 downto 0);
  signal repANF_9  : array_of_signed_32(0 to 15);
  signal repANF_10 : product8;
  signal ds5_11    : array_of_signed_32(0 to 15);
  signal tmp_13    : array_of_signed_32(0 to 15);
  signal tmp_22    : array_of_signed_32(0 to 15);
begin
  bodyVar_o <= (product7_sel0 => altLet_1
               ,product7_sel1 => repANF_0);
  
  Solver_satPlus_4_repANF_0 : entity Solver_satPlus_4
    port map
      (bodyVar_o => repANF_0
      ,eta_i1    => ds1_2
      ,eta_i2    => ds3_8);
  
  with (subjLet_3) select
    altLet_1 <= altLet_4 when (true),
                ds_5 when others;
  
  ds1_2 <= eta_i2.product7_sel1;
  
  subjLet_3 <= ds1_2 < ds2_7;
  
  zipWith_n_15 : block
    signal n_16 : array_of_signed_32(0 to 15);
    signal n_17 : array_of_signed_32(0 to 15);
  begin
    n_16 <= ds_5;
    n_17 <= repANF_6;
  
    zipWithZ_n_18 : if tmp_13'length = 0 generate
      tmp_13 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_19 : if tmp_13'length /= 0 generate
      zipWithIter_n_20 : for n_21 in tmp_13'range generate
      begin
        Solver_satPlus_4_14 : entity Solver_satPlus_4
  port map
  (bodyVar_o => tmp_13(n_21)
  ,eta_i1 => n_16(n_21)
  ,eta_i2 => n_17(n_21));
      end generate;
    end generate;
  end block;
  
  altLet_4 <= tmp_13;
  
  ds_5 <= eta_i2.product7_sel0;
  
  map_n_24 : block
    signal n_25 : array_of_signed_32(0 to 15);
  begin
    n_25 <= repANF_9;
  
    mapZ_n_26 : if tmp_22'length = 0 generate
      tmp_22 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_27 : if tmp_22'length /= 0 generate
      mapIter_n_28 : for n_29 in tmp_22'range generate
      begin
        Solver_specF_5_23 : entity Solver_specF_5
  port map
  (topLet_o => tmp_22(n_29)
  ,c_timestep_i1 => ds3_8
  ,ds6_i2 => n_25(n_29));
      end generate;
    end generate;
  end block;
  
  repANF_6 <= tmp_22;
  
  ds2_7 <= pTS_i1.product5_sel0;
  
  ds3_8 <= pTS_i1.product5_sel1;
  
  Solver_matrix3d_11_repANF_9 : entity Solver_matrix3d_11
    port map
      (x_o   => repANF_9
      ,ds_i1 => repANF_10);
  
  repANF_10 <= (product8_sel0 => eta_i2
               ,product8_sel1 => ds5_11);
  
  ds5_11 <= pTS_i1.product5_sel3;
end;
