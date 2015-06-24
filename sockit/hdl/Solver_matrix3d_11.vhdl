-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_matrix3d_11 is
  port(ds_i1 : in product8;
       x_o   : out array_of_signed_32(0 to 3));
end;

architecture structural of Solver_matrix3d_11 is
  signal repANF_0    : signed(31 downto 0);
  signal repANF_1    : signed(31 downto 0);
  signal repANF_2    : signed(31 downto 0);
  signal repANF_3    : signed(31 downto 0);
  signal repANF_4    : signed(31 downto 0);
  signal repANF_5    : signed(31 downto 0);
  signal repANF_6    : signed(31 downto 0);
  signal constants_7 : array_of_signed_32(0 to 12);
  signal repANF_8    : signed(31 downto 0);
  signal repANF_9    : signed(31 downto 0);
  signal repANF_10   : signed(31 downto 0);
  signal repANF_11   : signed(31 downto 0);
  signal repANF_12   : signed(31 downto 0);
  signal repANF_13   : signed(31 downto 0);
  signal repANF_14   : signed(31 downto 0);
  signal repANF_15   : signed(31 downto 0);
  signal repANF_16   : signed(31 downto 0);
  signal repANF_17   : signed(31 downto 0);
  signal repANF_18   : signed(31 downto 0);
  signal repANF_19   : signed(31 downto 0);
  signal repANF_20   : signed(31 downto 0);
  signal repANF_21   : signed(31 downto 0);
  signal repANF_22   : signed(31 downto 0);
  signal repANF_23   : signed(31 downto 0);
  signal ds16_24     : array_of_signed_32(0 to 3);
  signal repANF_25   : array_of_signed_32(0 to 0);
  signal repANF_26   : signed(31 downto 0);
  signal repANF_27   : signed(31 downto 0);
  signal repANF_28   : signed(31 downto 0);
  signal odestate_29 : product7;
  signal repANF_30   : array_of_signed_32(0 to 1);
  signal repANF_31   : signed(31 downto 0);
  signal repANF_32   : array_of_signed_32(0 to 2);
  signal bodyVar_33  : array_of_signed_32(0 to 6);
  signal subjLet_34  : product9;
  signal tmp_35      : signed(31 downto 0);
  signal tmp_39      : signed(31 downto 0);
  signal tmp_43      : signed(31 downto 0);
  signal tmp_47      : signed(31 downto 0);
  signal tmp_51      : signed(31 downto 0);
  signal tmp_55      : signed(31 downto 0);
  signal tmp_59      : signed(31 downto 0);
  signal tmp_63      : signed(31 downto 0);
  signal tmp_67      : signed(31 downto 0);
  signal tmp_71      : signed(31 downto 0);
  signal tmp_75      : signed(31 downto 0);
  signal tmp_79      : signed(31 downto 0);
  signal tmp_84      : product9;
begin
  indexVec_n_36 : block
    signal n_37 : array_of_signed_32(0 to 12);
    signal n_38 : integer;
  begin
    n_37 <= constants_7;
    n_38 <= 11;
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
  
  repANF_0 <= tmp_35;
  
  indexVec_n_40 : block
    signal n_41 : array_of_signed_32(0 to 12);
    signal n_42 : integer;
  begin
    n_41 <= constants_7;
    n_42 <= 10;
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
  
  repANF_1 <= tmp_39;
  
  indexVec_n_44 : block
    signal n_45 : array_of_signed_32(0 to 12);
    signal n_46 : integer;
  begin
    n_45 <= constants_7;
    n_46 <= 12;
    -- pragma translate_off
    process (n_45,n_46)
    begin
      if n_46 < n_45'low or n_46 > n_45'high then
        assert false report ("Index: " & integer'image(n_46) & ", is out of bounds: " & integer'image(n_45'low) & " to " & integer'image(n_45'high)) severity warning;
        tmp_43 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_43 <= n_45(n_46);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_2 <= tmp_43;
  
  Solver_satMult_12_repANF_3 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_3
      ,eta_i1   => repANF_0
      ,eta_i2   => repANF_13);
  
  Solver_satMult_12_repANF_4 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_4
      ,eta_i1   => repANF_1
      ,eta_i2   => repANF_15);
  
  indexVec_n_48 : block
    signal n_49 : array_of_signed_32(0 to 12);
    signal n_50 : integer;
  begin
    n_49 <= constants_7;
    n_50 <= 8;
    -- pragma translate_off
    process (n_49,n_50)
    begin
      if n_50 < n_49'low or n_50 > n_49'high then
        assert false report ("Index: " & integer'image(n_50) & ", is out of bounds: " & integer'image(n_49'low) & " to " & integer'image(n_49'high)) severity warning;
        tmp_47 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_47 <= n_49(n_50);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_5 <= tmp_47;
  
  indexVec_n_52 : block
    signal n_53 : array_of_signed_32(0 to 12);
    signal n_54 : integer;
  begin
    n_53 <= constants_7;
    n_54 <= 7;
    -- pragma translate_off
    process (n_53,n_54)
    begin
      if n_54 < n_53'low or n_54 > n_53'high then
        assert false report ("Index: " & integer'image(n_54) & ", is out of bounds: " & integer'image(n_53'low) & " to " & integer'image(n_53'high)) severity warning;
        tmp_51 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_51 <= n_53(n_54);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_6 <= tmp_51;
  
  constants_7 <= ds_i1.product8_sel1;
  
  Solver_satMult_12_repANF_8 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_8
      ,eta_i1   => repANF_2
      ,eta_i2   => repANF_20);
  
  Solver_satPlus_10_repANF_9 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_9
      ,eta_i1    => repANF_4
      ,eta_i2    => repANF_3);
  
  indexVec_n_56 : block
    signal n_57 : array_of_signed_32(0 to 12);
    signal n_58 : integer;
  begin
    n_57 <= constants_7;
    n_58 <= 9;
    -- pragma translate_off
    process (n_57,n_58)
    begin
      if n_58 < n_57'low or n_58 > n_57'high then
        assert false report ("Index: " & integer'image(n_58) & ", is out of bounds: " & integer'image(n_57'low) & " to " & integer'image(n_57'high)) severity warning;
        tmp_55 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_55 <= n_57(n_58);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_10 <= tmp_55;
  
  Solver_satMult_12_repANF_11 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_11
      ,eta_i1   => repANF_5
      ,eta_i2   => repANF_13);
  
  Solver_satMult_12_repANF_12 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_12
      ,eta_i1   => repANF_6
      ,eta_i2   => repANF_15);
  
  indexVec_n_60 : block
    signal n_61 : array_of_signed_32(0 to 3);
    signal n_62 : integer;
  begin
    n_61 <= ds16_24;
    n_62 <= 1;
    -- pragma translate_off
    process (n_61,n_62)
    begin
      if n_62 < n_61'low or n_62 > n_61'high then
        assert false report ("Index: " & integer'image(n_62) & ", is out of bounds: " & integer'image(n_61'low) & " to " & integer'image(n_61'high)) severity warning;
        tmp_59 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_59 <= n_61(n_62);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_13 <= tmp_59;
  
  indexVec_n_64 : block
    signal n_65 : array_of_signed_32(0 to 12);
    signal n_66 : integer;
  begin
    n_65 <= constants_7;
    n_66 <= 5;
    -- pragma translate_off
    process (n_65,n_66)
    begin
      if n_66 < n_65'low or n_66 > n_65'high then
        assert false report ("Index: " & integer'image(n_66) & ", is out of bounds: " & integer'image(n_65'low) & " to " & integer'image(n_65'high)) severity warning;
        tmp_63 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_63 <= n_65(n_66);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_14 <= tmp_63;
  
  indexVec_n_68 : block
    signal n_69 : array_of_signed_32(0 to 3);
    signal n_70 : integer;
  begin
    n_69 <= ds16_24;
    n_70 <= 0;
    -- pragma translate_off
    process (n_69,n_70)
    begin
      if n_70 < n_69'low or n_70 > n_69'high then
        assert false report ("Index: " & integer'image(n_70) & ", is out of bounds: " & integer'image(n_69'low) & " to " & integer'image(n_69'high)) severity warning;
        tmp_67 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_67 <= n_69(n_70);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_15 <= tmp_67;
  
  indexVec_n_72 : block
    signal n_73 : array_of_signed_32(0 to 12);
    signal n_74 : integer;
  begin
    n_73 <= constants_7;
    n_74 <= 4;
    -- pragma translate_off
    process (n_73,n_74)
    begin
      if n_74 < n_73'low or n_74 > n_73'high then
        assert false report ("Index: " & integer'image(n_74) & ", is out of bounds: " & integer'image(n_73'low) & " to " & integer'image(n_73'high)) severity warning;
        tmp_71 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_71 <= n_73(n_74);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_16 <= tmp_71;
  
  Solver_satPlus_10_repANF_17 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_17
      ,eta_i1    => repANF_9
      ,eta_i2    => repANF_8);
  
  Solver_satMult_12_repANF_18 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_18
      ,eta_i1   => repANF_10
      ,eta_i2   => repANF_20);
  
  Solver_satPlus_10_repANF_19 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_19
      ,eta_i1    => repANF_12
      ,eta_i2    => repANF_11);
  
  indexVec_n_76 : block
    signal n_77 : array_of_signed_32(0 to 3);
    signal n_78 : integer;
  begin
    n_77 <= ds16_24;
    n_78 <= 2;
    -- pragma translate_off
    process (n_77,n_78)
    begin
      if n_78 < n_77'low or n_78 > n_77'high then
        assert false report ("Index: " & integer'image(n_78) & ", is out of bounds: " & integer'image(n_77'low) & " to " & integer'image(n_77'high)) severity warning;
        tmp_75 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_75 <= n_77(n_78);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_20 <= tmp_75;
  
  indexVec_n_80 : block
    signal n_81 : array_of_signed_32(0 to 12);
    signal n_82 : integer;
  begin
    n_81 <= constants_7;
    n_82 <= 6;
    -- pragma translate_off
    process (n_81,n_82)
    begin
      if n_82 < n_81'low or n_82 > n_81'high then
        assert false report ("Index: " & integer'image(n_82) & ", is out of bounds: " & integer'image(n_81'low) & " to " & integer'image(n_81'high)) severity warning;
        tmp_79 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_79 <= n_81(n_82);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_21 <= tmp_79;
  
  Solver_satMult_12_repANF_22 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_22
      ,eta_i1   => repANF_14
      ,eta_i2   => repANF_13);
  
  Solver_satMult_12_repANF_23 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_23
      ,eta_i1   => repANF_16
      ,eta_i2   => repANF_15);
  
  ds16_24 <= odestate_29.product7_sel0;
  
  repANF_25 <= array_of_signed_32'(0 => repANF_17);
  
  Solver_satPlus_10_repANF_26 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_26
      ,eta_i1    => repANF_19
      ,eta_i2    => repANF_18);
  
  Solver_satMult_12_repANF_27 : entity Solver_satMult_12
    port map
      (topLet_o => repANF_27
      ,eta_i1   => repANF_21
      ,eta_i2   => repANF_20);
  
  Solver_satPlus_10_repANF_28 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_28
      ,eta_i1    => repANF_23
      ,eta_i2    => repANF_22);
  
  odestate_29 <= ds_i1.product8_sel0;
  
  repANF_30 <= array_of_signed_32'(signed'(repANF_26) & repANF_25);
  
  Solver_satPlus_10_repANF_31 : entity Solver_satPlus_10
    port map
      (bodyVar_o => repANF_31
      ,eta_i1    => repANF_28
      ,eta_i2    => repANF_27);
  
  repANF_32 <= array_of_signed_32'(signed'(repANF_31) & repANF_30);
  
  x_o <= subjLet_34.product9_sel0;
  
  bodyVar_33 <= array_of_signed_32'(repANF_32) & array_of_signed_32'(ds16_24);
  
  splitAt_n_86 : block
    signal n_87 : array_of_signed_32(0 to 6);
  begin
    n_87 <= bodyVar_33;
    tmp_84 <= (n_87(tmp_84.product9_sel0'left to tmp_84.product9_sel0'right)
               ,n_87(tmp_84.product9_sel1'left + tmp_84.product9_sel0'length to tmp_84.product9_sel1'right + tmp_84.product9_sel0'length));
  end block;
  
  subjLet_34 <= tmp_84;
end;
