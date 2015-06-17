-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_matrix2d_11 is
  port(ds_i1 : in product4;
       x_o   : out array_of_signed_32(0 to 15));
end;

architecture structural of Solver_matrix2d_11 is
  signal constants_0 : array_of_signed_32(0 to 15);
  signal repANF_1    : signed(31 downto 0);
  signal repANF_2    : signed(31 downto 0);
  signal repANF_3    : signed(31 downto 0);
  signal repANF_4    : signed(31 downto 0);
  signal repANF_5    : signed(31 downto 0);
  signal repANF_6    : signed(31 downto 0);
  signal repANF_7    : signed(31 downto 0);
  signal repANF_8    : signed(31 downto 0);
  signal ds15_9      : array_of_signed_32(0 to 15);
  signal repANF_10   : signed(31 downto 0);
  signal repANF_11   : signed(31 downto 0);
  signal repANF_12   : signed(31 downto 0);
  signal odeState_13 : product3;
  signal repANF_14   : array_of_signed_32(0 to 0);
  signal repANF_15   : signed(31 downto 0);
  signal repANF_16   : array_of_signed_32(0 to 1);
  signal bodyVar_17  : array_of_signed_32(0 to 17);
  signal subjLet_18  : product5;
  signal tmp_19      : signed(31 downto 0);
  signal tmp_23      : signed(31 downto 0);
  signal tmp_27      : signed(31 downto 0);
  signal tmp_31      : signed(31 downto 0);
  signal tmp_35      : signed(31 downto 0);
  signal tmp_39      : signed(31 downto 0);
  signal tmp_44      : product5;
begin
  constants_0 <= ds_i1.product4_sel1;
  
  indexVec_n_20 : block
    signal n_21 : array_of_signed_32(0 to 15);
    signal n_22 : integer;
  begin
    n_21 <= constants_0;
    n_22 <= 7;
    -- pragma translate_off
    process (n_21,n_22)
    begin
      if n_22 < n_21'low or n_22 > n_21'high then
        assert false report ("Index: " & integer'image(n_22) & ", is out of bounds: " & integer'image(n_21'low) & " to " & integer'image(n_21'high)) severity warning;
        tmp_19 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_19 <= n_21(n_22);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_1 <= tmp_19;
  
  indexVec_n_24 : block
    signal n_25 : array_of_signed_32(0 to 15);
    signal n_26 : integer;
  begin
    n_25 <= constants_0;
    n_26 <= 6;
    -- pragma translate_off
    process (n_25,n_26)
    begin
      if n_26 < n_25'low or n_26 > n_25'high then
        assert false report ("Index: " & integer'image(n_26) & ", is out of bounds: " & integer'image(n_25'low) & " to " & integer'image(n_25'high)) severity warning;
        tmp_23 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_23 <= n_25(n_26);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_2 <= tmp_23;
  
  Solver_satMult_12_repANF_3 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_3
      ,eta_i1   => repANF_1
      ,eta_i2   => repANF_5);
  
  Solver_satMult_12_repANF_4 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_4
      ,eta_i1   => repANF_2
      ,eta_i2   => repANF_7);
  
  indexVec_n_28 : block
    signal n_29 : array_of_signed_32(0 to 15);
    signal n_30 : integer;
  begin
    n_29 <= ds15_9;
    n_30 <= 1;
    -- pragma translate_off
    process (n_29,n_30)
    begin
      if n_30 < n_29'low or n_30 > n_29'high then
        assert false report ("Index: " & integer'image(n_30) & ", is out of bounds: " & integer'image(n_29'low) & " to " & integer'image(n_29'high)) severity warning;
        tmp_27 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_27 <= n_29(n_30);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_5 <= tmp_27;
  
  indexVec_n_32 : block
    signal n_33 : array_of_signed_32(0 to 15);
    signal n_34 : integer;
  begin
    n_33 <= constants_0;
    n_34 <= 5;
    -- pragma translate_off
    process (n_33,n_34)
    begin
      if n_34 < n_33'low or n_34 > n_33'high then
        assert false report ("Index: " & integer'image(n_34) & ", is out of bounds: " & integer'image(n_33'low) & " to " & integer'image(n_33'high)) severity warning;
        tmp_31 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_31 <= n_33(n_34);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_6 <= tmp_31;
  
  indexVec_n_36 : block
    signal n_37 : array_of_signed_32(0 to 15);
    signal n_38 : integer;
  begin
    n_37 <= ds15_9;
    n_38 <= 0;
    -- pragma translate_off
    process (n_37,n_38)
    begin
      if n_38 < n_37'low or n_38 > n_37'high then
        assert false report ("Index: " & integer'image(n_38) & ", is out of bounds: " & integer'image(n_37'low) & " to " & integer'image(n_37'high)) severity warning;
        tmp_35 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_35 <= n_37(n_38);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_7 <= tmp_35;
  
  indexVec_n_40 : block
    signal n_41 : array_of_signed_32(0 to 15);
    signal n_42 : integer;
  begin
    n_41 <= constants_0;
    n_42 <= 4;
    -- pragma translate_off
    process (n_41,n_42)
    begin
      if n_42 < n_41'low or n_42 > n_41'high then
        assert false report ("Index: " & integer'image(n_42) & ", is out of bounds: " & integer'image(n_41'low) & " to " & integer'image(n_41'high)) severity warning;
        tmp_39 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_39 <= n_41(n_42);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_8 <= tmp_39;
  
  ds15_9 <= odeState_13.product3_sel0;
  
  Solver_satPlus_4_repANF_10 : entity Solver_satPlus_4
    port map
      (bodyVar_o => repANF_10
      ,eta_i1    => repANF_4
      ,eta_i2    => repANF_3);
  
  Solver_satMult_12_repANF_11 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_11
      ,eta_i1   => repANF_6
      ,eta_i2   => repANF_5);
  
  Solver_satMult_12_repANF_12 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_12
      ,eta_i1   => repANF_8
      ,eta_i2   => repANF_7);
  
  odeState_13 <= ds_i1.product4_sel0;
  
  repANF_14 <= array_of_signed_32'(0 => repANF_10);
  
  Solver_satPlus_4_repANF_15 : entity Solver_satPlus_4
    port map
      (bodyVar_o => repANF_15
      ,eta_i1    => repANF_12
      ,eta_i2    => repANF_11);
  
  repANF_16 <= array_of_signed_32'(signed'(repANF_15) & repANF_14);
  
  x_o <= subjLet_18.product5_sel0;
  
  bodyVar_17 <= array_of_signed_32'(repANF_16) & array_of_signed_32'(ds15_9);
  
  splitAt_n_46 : block
    signal n_47 : array_of_signed_32(0 to 17);
  begin
    n_47 <= bodyVar_17;
    tmp_44 <= (n_47(tmp_44.product5_sel0'left to tmp_44.product5_sel0'right)
               ,n_47(tmp_44.product5_sel1'left + tmp_44.product5_sel0'length to tmp_44.product5_sel1'right + tmp_44.product5_sel0'length));
  end block;
  
  subjLet_18 <= tmp_44;
end;
