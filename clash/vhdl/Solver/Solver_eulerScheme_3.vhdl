-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_eulerScheme_3 is
  port(pTS_i1    : in product2;
       eta_i2    : in product3;
       bodyVar_o : out product3);
end;

architecture structural of Solver_eulerScheme_3 is
  signal a3_0      : signed(31 downto 0);
  signal altLet_1  : array_of_signed_32(0 to 15);
  signal ds1_2     : signed(31 downto 0);
  signal subjLet_3 : boolean;
  signal altLet_4  : array_of_signed_32(0 to 15);
  signal altLet_5  : array_of_signed_32(0 to 15);
  signal repANF_6  : array_of_signed_32(0 to 15);
  signal ds2_7     : signed(31 downto 0);
  signal ds3_8     : signed(31 downto 0);
  signal ds_9      : array_of_signed_32(0 to 15);
  signal repANF_10 : array_of_signed_32(0 to 15);
  signal repANF_11 : array_of_signed_32(0 to 15);
  signal repANF_12 : product4;
  signal ds5_13    : array_of_signed_32(0 to 15);
  signal tmp_15    : array_of_signed_32(0 to 15);
  signal tmp_21    : array_of_signed_32(0 to 15);
  signal tmp_27    : array_of_signed_32(0 to 15);
  signal tmp_36    : array_of_signed_32(0 to 15);
begin
  bodyVar_o <= (product3_sel0 => altLet_1
               ,product3_sel1 => a3_0);
  
  Solver_satPlus_4_a3_0 : entity Solver_satPlus_4
    port map
      (bodyVar_o => a3_0
      ,eta_i1    => ds1_2
      ,eta_i2    => ds3_8);
  
  with (subjLet_3) select
    altLet_1 <= altLet_5 when (true),
                altLet_4 when others;
  
  ds1_2 <= eta_i2.product3_sel1;
  
  subjLet_3 <= ds1_2 > ds2_7;
  
  replaceVec_n_16 : block
    signal n_17 : array_of_signed_32(0 to 15);
    signal n_18 : integer;
    signal n_19 : signed(31 downto 0);
  begin
    n_17 <= repANF_6;
    n_18 <= 15;
    n_19 <= a3_0;
    process(n_17,n_18,n_19)
      variable n_20 : array_of_signed_32(0 to 15);
    begin
      n_20 := n_17;
      -- pragma translate_off
      if n_18 < n_20'low or n_18 > n_20'high then
        assert false report ("Index: " & integer'image(n_18) & ", is out of bounds: " & integer'image(n_17'low) & " to " & integer'image(n_17'high)) severity warning;
        n_20 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_20(n_18) := n_19;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_15 <= n_20;
    end process;
  end block;
  
  altLet_4 <= tmp_15;
  
  replaceVec_n_22 : block
    signal n_23 : array_of_signed_32(0 to 15);
    signal n_24 : integer;
    signal n_25 : signed(31 downto 0);
  begin
    n_23 <= ds_9;
    n_24 <= 15;
    n_25 <= a3_0;
    process(n_23,n_24,n_25)
      variable n_26 : array_of_signed_32(0 to 15);
    begin
      n_26 := n_23;
      -- pragma translate_off
      if n_24 < n_26'low or n_24 > n_26'high then
        assert false report ("Index: " & integer'image(n_24) & ", is out of bounds: " & integer'image(n_23'low) & " to " & integer'image(n_23'high)) severity warning;
        n_26 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_26(n_24) := n_25;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_21 <= n_26;
    end process;
  end block;
  
  altLet_5 <= tmp_21;
  
  zipWith_n_29 : block
    signal n_30 : array_of_signed_32(0 to 15);
    signal n_31 : array_of_signed_32(0 to 15);
  begin
    n_30 <= ds_9;
    n_31 <= repANF_10;
  
    zipWithZ_n_32 : if tmp_27'length = 0 generate
      tmp_27 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_33 : if tmp_27'length /= 0 generate
      zipWithIter_n_34 : for n_35 in tmp_27'range generate
      begin
        Solver_satPlus_4_28 : entity Solver_satPlus_4
  port map
  (bodyVar_o => tmp_27(n_35)
  ,eta_i1 => n_30(n_35)
  ,eta_i2 => n_31(n_35));
      end generate;
    end generate;
  end block;
  
  repANF_6 <= tmp_27;
  
  ds2_7 <= pTS_i1.product2_sel0;
  
  ds3_8 <= pTS_i1.product2_sel1;
  
  ds_9 <= eta_i2.product3_sel0;
  
  map_n_38 : block
    signal n_39 : array_of_signed_32(0 to 15);
  begin
    n_39 <= repANF_11;
  
    mapZ_n_40 : if tmp_36'length = 0 generate
      tmp_36 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_41 : if tmp_36'length /= 0 generate
      mapIter_n_42 : for n_43 in tmp_36'range generate
      begin
        Solver_specF_5_37 : entity Solver_specF_5
  port map
  (topLet_o => tmp_36(n_43)
  ,c_timestep_i1 => ds3_8
  ,ds6_i2 => n_39(n_43));
      end generate;
    end generate;
  end block;
  
  repANF_10 <= tmp_36;
  
  Solver_matrix2d_11_repANF_11 : entity Solver_matrix2d_11
    port map
      (x_o   => repANF_11
      ,ds_i1 => repANF_12);
  
  repANF_12 <= (product4_sel0 => eta_i2
               ,product4_sel1 => ds5_13);
  
  ds5_13 <= pTS_i1.product2_sel3;
end;
