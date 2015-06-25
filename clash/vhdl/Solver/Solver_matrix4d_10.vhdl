-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_matrix4d_10 is
  port(ds_i1 : in product2;
       x_o   : out array_of_signed_32(0 to 4));
end;

architecture structural of Solver_matrix4d_10 is
  signal repANF_0     : signed(31 downto 0);
  signal repANF_1     : signed(31 downto 0);
  signal repANF_2     : signed(31 downto 0);
  signal repANF_3     : signed(31 downto 0);
  signal repANF_4     : signed(31 downto 0);
  signal repANF_5     : signed(31 downto 0);
  signal repANF_6     : signed(31 downto 0);
  signal repANF_7     : signed(31 downto 0);
  signal repANF_8     : signed(31 downto 0);
  signal repANF_9     : signed(31 downto 0);
  signal repANF_10    : signed(31 downto 0);
  signal repANF_11    : signed(31 downto 0);
  signal repANF_12    : signed(31 downto 0);
  signal repANF_13    : signed(31 downto 0);
  signal repANF_14    : signed(31 downto 0);
  signal repANF_15    : signed(31 downto 0);
  signal repANF_16    : signed(31 downto 0);
  signal repANF_17    : signed(31 downto 0);
  signal repANF_18    : signed(31 downto 0);
  signal repANF_19    : signed(31 downto 0);
  signal repANF_20    : signed(31 downto 0);
  signal repANF_21    : signed(31 downto 0);
  signal repANF_22    : signed(31 downto 0);
  signal repANF_23    : signed(31 downto 0);
  signal repANF_24    : signed(31 downto 0);
  signal repANF_25    : signed(31 downto 0);
  signal repANF_26    : signed(31 downto 0);
  signal constants_27 : array_of_signed_32(0 to 19);
  signal repANF_28    : signed(31 downto 0);
  signal repANF_29    : signed(31 downto 0);
  signal repANF_30    : signed(31 downto 0);
  signal repANF_31    : signed(31 downto 0);
  signal repANF_32    : signed(31 downto 0);
  signal repANF_33    : signed(31 downto 0);
  signal repANF_34    : signed(31 downto 0);
  signal repANF_35    : signed(31 downto 0);
  signal repANF_36    : signed(31 downto 0);
  signal repANF_37    : signed(31 downto 0);
  signal repANF_38    : array_of_signed_32(0 to 0);
  signal repANF_39    : signed(31 downto 0);
  signal repANF_40    : signed(31 downto 0);
  signal repANF_41    : signed(31 downto 0);
  signal repANF_42    : signed(31 downto 0);
  signal repANF_43    : signed(31 downto 0);
  signal repANF_44    : signed(31 downto 0);
  signal repANF_45    : signed(31 downto 0);
  signal ds16_46      : array_of_signed_32(0 to 4);
  signal repANF_47    : array_of_signed_32(0 to 1);
  signal repANF_48    : signed(31 downto 0);
  signal repANF_49    : signed(31 downto 0);
  signal repANF_50    : signed(31 downto 0);
  signal odestate_51  : product3;
  signal repANF_52    : array_of_signed_32(0 to 2);
  signal repANF_53    : signed(31 downto 0);
  signal repANF_54    : array_of_signed_32(0 to 3);
  signal bodyVar_55   : array_of_signed_32(0 to 8);
  signal subjLet_56   : product4;
  signal tmp_57       : signed(31 downto 0);
  signal tmp_61       : signed(31 downto 0);
  signal tmp_65       : signed(31 downto 0);
  signal tmp_69       : signed(31 downto 0);
  signal tmp_73       : signed(31 downto 0);
  signal tmp_77       : signed(31 downto 0);
  signal tmp_81       : signed(31 downto 0);
  signal tmp_85       : signed(31 downto 0);
  signal tmp_89       : signed(31 downto 0);
  signal tmp_93       : signed(31 downto 0);
  signal tmp_97       : signed(31 downto 0);
  signal tmp_101      : signed(31 downto 0);
  signal tmp_105      : signed(31 downto 0);
  signal tmp_109      : signed(31 downto 0);
  signal tmp_113      : signed(31 downto 0);
  signal tmp_117      : signed(31 downto 0);
  signal tmp_121      : signed(31 downto 0);
  signal tmp_125      : signed(31 downto 0);
  signal tmp_129      : signed(31 downto 0);
  signal tmp_133      : signed(31 downto 0);
  signal tmp_138      : product4;
begin
  indexVec_n_58 : block
    signal n_59 : array_of_signed_32(0 to 19);
    signal n_60 : integer;
  begin
    n_59 <= constants_27;
    n_60 <= 17;
    -- pragma translate_off
    process (n_59,n_60)
    begin
      if n_60 < n_59'low or n_60 > n_59'high then
        assert false report ("Index: " & integer'image(n_60) & ", is out of bounds: " & integer'image(n_59'low) & " to " & integer'image(n_59'high)) severity warning;
        tmp_57 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_57 <= n_59(n_60);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_0 <= tmp_57;
  
  indexVec_n_62 : block
    signal n_63 : array_of_signed_32(0 to 19);
    signal n_64 : integer;
  begin
    n_63 <= constants_27;
    n_64 <= 16;
    -- pragma translate_off
    process (n_63,n_64)
    begin
      if n_64 < n_63'low or n_64 > n_63'high then
        assert false report ("Index: " & integer'image(n_64) & ", is out of bounds: " & integer'image(n_63'low) & " to " & integer'image(n_63'high)) severity warning;
        tmp_61 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_61 <= n_63(n_64);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_1 <= tmp_61;
  
  indexVec_n_66 : block
    signal n_67 : array_of_signed_32(0 to 19);
    signal n_68 : integer;
  begin
    n_67 <= constants_27;
    n_68 <= 18;
    -- pragma translate_off
    process (n_67,n_68)
    begin
      if n_68 < n_67'low or n_68 > n_67'high then
        assert false report ("Index: " & integer'image(n_68) & ", is out of bounds: " & integer'image(n_67'low) & " to " & integer'image(n_67'high)) severity warning;
        tmp_65 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_65 <= n_67(n_68);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_2 <= tmp_65;
  
  Solver_satMult_11_repANF_3 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_3
      ,eta_i1   => repANF_0
      ,eta_i2   => repANF_23);
  
  Solver_satMult_11_repANF_4 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_4
      ,eta_i1   => repANF_1
      ,eta_i2   => repANF_25);
  
  indexVec_n_70 : block
    signal n_71 : array_of_signed_32(0 to 19);
    signal n_72 : integer;
  begin
    n_71 <= constants_27;
    n_72 <= 13;
    -- pragma translate_off
    process (n_71,n_72)
    begin
      if n_72 < n_71'low or n_72 > n_71'high then
        assert false report ("Index: " & integer'image(n_72) & ", is out of bounds: " & integer'image(n_71'low) & " to " & integer'image(n_71'high)) severity warning;
        tmp_69 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_69 <= n_71(n_72);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_5 <= tmp_69;
  
  indexVec_n_74 : block
    signal n_75 : array_of_signed_32(0 to 19);
    signal n_76 : integer;
  begin
    n_75 <= constants_27;
    n_76 <= 12;
    -- pragma translate_off
    process (n_75,n_76)
    begin
      if n_76 < n_75'low or n_76 > n_75'high then
        assert false report ("Index: " & integer'image(n_76) & ", is out of bounds: " & integer'image(n_75'low) & " to " & integer'image(n_75'high)) severity warning;
        tmp_73 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_73 <= n_75(n_76);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_6 <= tmp_73;
  
  indexVec_n_78 : block
    signal n_79 : array_of_signed_32(0 to 19);
    signal n_80 : integer;
  begin
    n_79 <= constants_27;
    n_80 <= 19;
    -- pragma translate_off
    process (n_79,n_80)
    begin
      if n_80 < n_79'low or n_80 > n_79'high then
        assert false report ("Index: " & integer'image(n_80) & ", is out of bounds: " & integer'image(n_79'low) & " to " & integer'image(n_79'high)) severity warning;
        tmp_77 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_77 <= n_79(n_80);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_7 <= tmp_77;
  
  Solver_satMult_11_repANF_8 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_8
      ,eta_i1   => repANF_2
      ,eta_i2   => repANF_34);
  
  Solver_satPlus_9_repANF_9 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_9
      ,eta_i1    => repANF_4
      ,eta_i2    => repANF_3);
  
  indexVec_n_82 : block
    signal n_83 : array_of_signed_32(0 to 19);
    signal n_84 : integer;
  begin
    n_83 <= constants_27;
    n_84 <= 14;
    -- pragma translate_off
    process (n_83,n_84)
    begin
      if n_84 < n_83'low or n_84 > n_83'high then
        assert false report ("Index: " & integer'image(n_84) & ", is out of bounds: " & integer'image(n_83'low) & " to " & integer'image(n_83'high)) severity warning;
        tmp_81 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_81 <= n_83(n_84);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_10 <= tmp_81;
  
  Solver_satMult_11_repANF_11 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_11
      ,eta_i1   => repANF_5
      ,eta_i2   => repANF_23);
  
  Solver_satMult_11_repANF_12 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_12
      ,eta_i1   => repANF_6
      ,eta_i2   => repANF_25);
  
  indexVec_n_86 : block
    signal n_87 : array_of_signed_32(0 to 19);
    signal n_88 : integer;
  begin
    n_87 <= constants_27;
    n_88 <= 9;
    -- pragma translate_off
    process (n_87,n_88)
    begin
      if n_88 < n_87'low or n_88 > n_87'high then
        assert false report ("Index: " & integer'image(n_88) & ", is out of bounds: " & integer'image(n_87'low) & " to " & integer'image(n_87'high)) severity warning;
        tmp_85 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_85 <= n_87(n_88);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_13 <= tmp_85;
  
  indexVec_n_90 : block
    signal n_91 : array_of_signed_32(0 to 19);
    signal n_92 : integer;
  begin
    n_91 <= constants_27;
    n_92 <= 8;
    -- pragma translate_off
    process (n_91,n_92)
    begin
      if n_92 < n_91'low or n_92 > n_91'high then
        assert false report ("Index: " & integer'image(n_92) & ", is out of bounds: " & integer'image(n_91'low) & " to " & integer'image(n_91'high)) severity warning;
        tmp_89 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_89 <= n_91(n_92);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_14 <= tmp_89;
  
  Solver_satMult_11_repANF_15 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_15
      ,eta_i1   => repANF_7
      ,eta_i2   => repANF_42);
  
  Solver_satPlus_9_repANF_16 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_16
      ,eta_i1    => repANF_9
      ,eta_i2    => repANF_8);
  
  indexVec_n_94 : block
    signal n_95 : array_of_signed_32(0 to 19);
    signal n_96 : integer;
  begin
    n_95 <= constants_27;
    n_96 <= 15;
    -- pragma translate_off
    process (n_95,n_96)
    begin
      if n_96 < n_95'low or n_96 > n_95'high then
        assert false report ("Index: " & integer'image(n_96) & ", is out of bounds: " & integer'image(n_95'low) & " to " & integer'image(n_95'high)) severity warning;
        tmp_93 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_93 <= n_95(n_96);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_17 <= tmp_93;
  
  Solver_satMult_11_repANF_18 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_18
      ,eta_i1   => repANF_10
      ,eta_i2   => repANF_34);
  
  Solver_satPlus_9_repANF_19 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_19
      ,eta_i1    => repANF_12
      ,eta_i2    => repANF_11);
  
  indexVec_n_98 : block
    signal n_99 : array_of_signed_32(0 to 19);
    signal n_100 : integer;
  begin
    n_99 <= constants_27;
    n_100 <= 10;
    -- pragma translate_off
    process (n_99,n_100)
    begin
      if n_100 < n_99'low or n_100 > n_99'high then
        assert false report ("Index: " & integer'image(n_100) & ", is out of bounds: " & integer'image(n_99'low) & " to " & integer'image(n_99'high)) severity warning;
        tmp_97 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_97 <= n_99(n_100);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_20 <= tmp_97;
  
  Solver_satMult_11_repANF_21 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_21
      ,eta_i1   => repANF_13
      ,eta_i2   => repANF_23);
  
  Solver_satMult_11_repANF_22 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_22
      ,eta_i1   => repANF_14
      ,eta_i2   => repANF_25);
  
  indexVec_n_102 : block
    signal n_103 : array_of_signed_32(0 to 4);
    signal n_104 : integer;
  begin
    n_103 <= ds16_46;
    n_104 <= 1;
    -- pragma translate_off
    process (n_103,n_104)
    begin
      if n_104 < n_103'low or n_104 > n_103'high then
        assert false report ("Index: " & integer'image(n_104) & ", is out of bounds: " & integer'image(n_103'low) & " to " & integer'image(n_103'high)) severity warning;
        tmp_101 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_101 <= n_103(n_104);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_23 <= tmp_101;
  
  indexVec_n_106 : block
    signal n_107 : array_of_signed_32(0 to 19);
    signal n_108 : integer;
  begin
    n_107 <= constants_27;
    n_108 <= 5;
    -- pragma translate_off
    process (n_107,n_108)
    begin
      if n_108 < n_107'low or n_108 > n_107'high then
        assert false report ("Index: " & integer'image(n_108) & ", is out of bounds: " & integer'image(n_107'low) & " to " & integer'image(n_107'high)) severity warning;
        tmp_105 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_105 <= n_107(n_108);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_24 <= tmp_105;
  
  indexVec_n_110 : block
    signal n_111 : array_of_signed_32(0 to 4);
    signal n_112 : integer;
  begin
    n_111 <= ds16_46;
    n_112 <= 0;
    -- pragma translate_off
    process (n_111,n_112)
    begin
      if n_112 < n_111'low or n_112 > n_111'high then
        assert false report ("Index: " & integer'image(n_112) & ", is out of bounds: " & integer'image(n_111'low) & " to " & integer'image(n_111'high)) severity warning;
        tmp_109 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_109 <= n_111(n_112);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_25 <= tmp_109;
  
  indexVec_n_114 : block
    signal n_115 : array_of_signed_32(0 to 19);
    signal n_116 : integer;
  begin
    n_115 <= constants_27;
    n_116 <= 4;
    -- pragma translate_off
    process (n_115,n_116)
    begin
      if n_116 < n_115'low or n_116 > n_115'high then
        assert false report ("Index: " & integer'image(n_116) & ", is out of bounds: " & integer'image(n_115'low) & " to " & integer'image(n_115'high)) severity warning;
        tmp_113 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_113 <= n_115(n_116);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_26 <= tmp_113;
  
  constants_27 <= ds_i1.product2_sel1;
  
  Solver_satPlus_9_repANF_28 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_28
      ,eta_i1    => repANF_16
      ,eta_i2    => repANF_15);
  
  Solver_satMult_11_repANF_29 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_29
      ,eta_i1   => repANF_17
      ,eta_i2   => repANF_42);
  
  Solver_satPlus_9_repANF_30 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_30
      ,eta_i1    => repANF_19
      ,eta_i2    => repANF_18);
  
  indexVec_n_118 : block
    signal n_119 : array_of_signed_32(0 to 19);
    signal n_120 : integer;
  begin
    n_119 <= constants_27;
    n_120 <= 11;
    -- pragma translate_off
    process (n_119,n_120)
    begin
      if n_120 < n_119'low or n_120 > n_119'high then
        assert false report ("Index: " & integer'image(n_120) & ", is out of bounds: " & integer'image(n_119'low) & " to " & integer'image(n_119'high)) severity warning;
        tmp_117 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_117 <= n_119(n_120);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_31 <= tmp_117;
  
  Solver_satMult_11_repANF_32 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_32
      ,eta_i1   => repANF_20
      ,eta_i2   => repANF_34);
  
  Solver_satPlus_9_repANF_33 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_33
      ,eta_i1    => repANF_22
      ,eta_i2    => repANF_21);
  
  indexVec_n_122 : block
    signal n_123 : array_of_signed_32(0 to 4);
    signal n_124 : integer;
  begin
    n_123 <= ds16_46;
    n_124 <= 2;
    -- pragma translate_off
    process (n_123,n_124)
    begin
      if n_124 < n_123'low or n_124 > n_123'high then
        assert false report ("Index: " & integer'image(n_124) & ", is out of bounds: " & integer'image(n_123'low) & " to " & integer'image(n_123'high)) severity warning;
        tmp_121 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_121 <= n_123(n_124);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_34 <= tmp_121;
  
  indexVec_n_126 : block
    signal n_127 : array_of_signed_32(0 to 19);
    signal n_128 : integer;
  begin
    n_127 <= constants_27;
    n_128 <= 6;
    -- pragma translate_off
    process (n_127,n_128)
    begin
      if n_128 < n_127'low or n_128 > n_127'high then
        assert false report ("Index: " & integer'image(n_128) & ", is out of bounds: " & integer'image(n_127'low) & " to " & integer'image(n_127'high)) severity warning;
        tmp_125 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_125 <= n_127(n_128);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_35 <= tmp_125;
  
  Solver_satMult_11_repANF_36 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_36
      ,eta_i1   => repANF_24
      ,eta_i2   => repANF_23);
  
  Solver_satMult_11_repANF_37 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_37
      ,eta_i1   => repANF_26
      ,eta_i2   => repANF_25);
  
  repANF_38 <= array_of_signed_32'(0 => repANF_28);
  
  Solver_satPlus_9_repANF_39 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_39
      ,eta_i1    => repANF_30
      ,eta_i2    => repANF_29);
  
  Solver_satMult_11_repANF_40 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_40
      ,eta_i1   => repANF_31
      ,eta_i2   => repANF_42);
  
  Solver_satPlus_9_repANF_41 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_41
      ,eta_i1    => repANF_33
      ,eta_i2    => repANF_32);
  
  indexVec_n_130 : block
    signal n_131 : array_of_signed_32(0 to 4);
    signal n_132 : integer;
  begin
    n_131 <= ds16_46;
    n_132 <= 3;
    -- pragma translate_off
    process (n_131,n_132)
    begin
      if n_132 < n_131'low or n_132 > n_131'high then
        assert false report ("Index: " & integer'image(n_132) & ", is out of bounds: " & integer'image(n_131'low) & " to " & integer'image(n_131'high)) severity warning;
        tmp_129 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_129 <= n_131(n_132);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_42 <= tmp_129;
  
  indexVec_n_134 : block
    signal n_135 : array_of_signed_32(0 to 19);
    signal n_136 : integer;
  begin
    n_135 <= constants_27;
    n_136 <= 7;
    -- pragma translate_off
    process (n_135,n_136)
    begin
      if n_136 < n_135'low or n_136 > n_135'high then
        assert false report ("Index: " & integer'image(n_136) & ", is out of bounds: " & integer'image(n_135'low) & " to " & integer'image(n_135'high)) severity warning;
        tmp_133 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_133 <= n_135(n_136);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_43 <= tmp_133;
  
  Solver_satMult_11_repANF_44 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_44
      ,eta_i1   => repANF_35
      ,eta_i2   => repANF_34);
  
  Solver_satPlus_9_repANF_45 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_45
      ,eta_i1    => repANF_37
      ,eta_i2    => repANF_36);
  
  ds16_46 <= odestate_51.product3_sel0;
  
  repANF_47 <= array_of_signed_32'(signed'(repANF_39) & repANF_38);
  
  Solver_satPlus_9_repANF_48 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_48
      ,eta_i1    => repANF_41
      ,eta_i2    => repANF_40);
  
  Solver_satMult_11_repANF_49 : entity Solver_satMult_11
    port map
      (topLet_o => repANF_49
      ,eta_i1   => repANF_43
      ,eta_i2   => repANF_42);
  
  Solver_satPlus_9_repANF_50 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_50
      ,eta_i1    => repANF_45
      ,eta_i2    => repANF_44);
  
  odestate_51 <= ds_i1.product2_sel0;
  
  repANF_52 <= array_of_signed_32'(signed'(repANF_48) & repANF_47);
  
  Solver_satPlus_9_repANF_53 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_53
      ,eta_i1    => repANF_50
      ,eta_i2    => repANF_49);
  
  repANF_54 <= array_of_signed_32'(signed'(repANF_53) & repANF_52);
  
  x_o <= subjLet_56.product4_sel0;
  
  bodyVar_55 <= array_of_signed_32'(repANF_54) & array_of_signed_32'(ds16_46);
  
  splitAt_n_140 : block
    signal n_141 : array_of_signed_32(0 to 8);
  begin
    n_141 <= bodyVar_55;
    tmp_138 <= (n_141(tmp_138.product4_sel0'left to tmp_138.product4_sel0'right)
               ,n_141(tmp_138.product4_sel1'left + tmp_138.product4_sel0'length to tmp_138.product4_sel1'right + tmp_138.product4_sel0'length));
  end block;
  
  subjLet_56 <= tmp_138;
end;
