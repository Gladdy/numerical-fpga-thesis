-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_rk4_3 is
  port(pTS_i1    : in product5;
       eta_i2    : in product3;
       bodyVar_o : out product3);
end;

architecture structural of Solver_rk4_3 is
  signal repANF_0   : array_of_signed_32(0 to 4);
  signal repANF_1   : array_of_signed_32(0 to 4);
  signal repANF_2   : product3;
  signal repANF_3   : product2;
  signal repANF_4   : array_of_signed_32(0 to 4);
  signal h2_5       : signed(31 downto 0);
  signal repANF_6   : array_of_signed_32(0 to 4);
  signal repANF_7   : signed(31 downto 0);
  signal repANF_8   : array_of_signed_32(0 to 4);
  signal repANF_9   : array_of_signed_32(0 to 4);
  signal bodyVar_10 : product3;
  signal repANF_11  : array_of_signed_32(0 to 4);
  signal ds5_12     : array_of_signed_32(0 to 19);
  signal repANF_13  : product2;
  signal repANF_14  : product3;
  signal repANF_15  : product2;
  signal k3_16      : array_of_signed_32(0 to 4);
  signal repANF_17  : product2;
  signal k1_18      : array_of_signed_32(0 to 4);
  signal k4_19      : array_of_signed_32(0 to 4);
  signal repANF_20  : array_of_signed_32(0 to 4);
  signal repANF_21  : array_of_signed_32(0 to 4);
  signal repANF_22  : array_of_signed_32(0 to 4);
  signal ds7_23     : signed(31 downto 0);
  signal ds16_24    : array_of_signed_32(0 to 4);
  signal repANF_25  : array_of_signed_32(0 to 4);
  signal repANF_26  : signed(31 downto 0);
  signal ds3_27     : signed(31 downto 0);
  signal bodyVar_28 : array_of_signed_32(0 to 4);
  signal ds2_29     : signed(31 downto 0);
  signal repANF_30  : signed(31 downto 0);
  signal repANF_31  : array_of_signed_32(0 to 4);
  signal altLet_32  : product6;
  signal altLet_33  : product6;
  signal subjLet_34 : boolean;
  signal bodyVar_35 : product6;
  signal xszm_36    : signed(31 downto 0);
  signal xszm_37    : array_of_signed_32(0 to 4);
  signal tmp_38     : array_of_signed_32(0 to 4);
  signal tmp_46     : array_of_signed_32(0 to 4);
  signal tmp_56     : signed(31 downto 0);
  signal tmp_57     : array_of_signed_32(0 to 4);
  signal tmp_65     : array_of_signed_32(0 to 4);
  signal tmp_74     : array_of_signed_32(0 to 4);
  signal tmp_82     : array_of_signed_32(0 to 4);
  signal tmp_91     : array_of_signed_32(0 to 4);
  signal tmp_100    : array_of_signed_32(0 to 4);
  signal tmp_108    : array_of_signed_32(0 to 4);
  signal tmp_117    : array_of_signed_32(0 to 4);
  signal tmp_127    : signed(31 downto 0);
  signal tmp_128    : array_of_signed_32(0 to 4);
  signal tmp_136    : array_of_signed_32(0 to 4);
begin
  map_n_40 : block
    signal n_41 : array_of_signed_32(0 to 4);
  begin
    n_41 <= k1_18;
  
    mapZ_n_42 : if tmp_38'length = 0 generate
      tmp_38 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_43 : if tmp_38'length /= 0 generate
      mapIter_n_44 : for n_45 in tmp_38'range generate
      begin
        Solver_satMult_4_39 : entity Solver_satMult_4
  port map
  (topLet_o => tmp_38(n_45)
  ,eta_i1 => h2_5
  ,eta_i2 => n_41(n_45));
      end generate;
    end generate;
  end block;
  
  repANF_0 <= tmp_38;
  
  zipWith_n_48 : block
    signal n_49 : array_of_signed_32(0 to 4);
    signal n_50 : array_of_signed_32(0 to 4);
  begin
    n_49 <= ds16_24;
    n_50 <= repANF_0;
  
    zipWithZ_n_51 : if tmp_46'length = 0 generate
      tmp_46 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_52 : if tmp_46'length /= 0 generate
      zipWithIter_n_53 : for n_54 in tmp_46'range generate
      begin
        Solver_satPlus_9_47 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_46(n_54)
  ,eta_i1 => n_49(n_54)
  ,eta_i2 => n_50(n_54));
      end generate;
    end generate;
  end block;
  
  repANF_1 <= tmp_46;
  
  repANF_2 <= (product3_sel0 => repANF_1
              ,product3_sel1 => repANF_7);
  
  repANF_3 <= (product2_sel0 => repANF_2
              ,product2_sel1 => ds5_12);
  
  Solver_matrix4d_10_repANF_4 : entity Solver_matrix4d_10
    port map
      (x_o   => repANF_4
      ,ds_i1 => repANF_3);
  
  tmp_56 <= signed'("00000000100000000000000000000000");
  
  Solver_satMult_4_h2_5 : entity Solver_satMult_4
    port map
      (topLet_o => h2_5
      ,eta_i1   => tmp_56
      ,eta_i2   => ds3_27);
  
  map_n_59 : block
    signal n_60 : array_of_signed_32(0 to 4);
  begin
    n_60 <= repANF_4;
  
    mapZ_n_61 : if tmp_57'length = 0 generate
      tmp_57 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_62 : if tmp_57'length /= 0 generate
      mapIter_n_63 : for n_64 in tmp_57'range generate
      begin
        Solver_satMult_4_58 : entity Solver_satMult_4
  port map
  (topLet_o => tmp_57(n_64)
  ,eta_i1 => h2_5
  ,eta_i2 => n_60(n_64));
      end generate;
    end generate;
  end block;
  
  repANF_6 <= tmp_57;
  
  Solver_satPlus_9_repANF_7 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_7
      ,eta_i1    => ds7_23
      ,eta_i2    => h2_5);
  
  zipWith_n_67 : block
    signal n_68 : array_of_signed_32(0 to 4);
    signal n_69 : array_of_signed_32(0 to 4);
  begin
    n_68 <= ds16_24;
    n_69 <= repANF_6;
  
    zipWithZ_n_70 : if tmp_65'length = 0 generate
      tmp_65 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_71 : if tmp_65'length /= 0 generate
      zipWithIter_n_72 : for n_73 in tmp_65'range generate
      begin
        Solver_satPlus_9_66 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_65(n_73)
  ,eta_i1 => n_68(n_73)
  ,eta_i2 => n_69(n_73));
      end generate;
    end generate;
  end block;
  
  repANF_8 <= tmp_65;
  
  map_n_76 : block
    signal n_77 : array_of_signed_32(0 to 4);
  begin
    n_77 <= k3_16;
  
    mapZ_n_78 : if tmp_74'length = 0 generate
      tmp_74 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_79 : if tmp_74'length /= 0 generate
      mapIter_n_80 : for n_81 in tmp_74'range generate
      begin
        Solver_satMult_4_75 : entity Solver_satMult_4
  port map
  (topLet_o => tmp_74(n_81)
  ,eta_i1 => ds3_27
  ,eta_i2 => n_77(n_81));
      end generate;
    end generate;
  end block;
  
  repANF_9 <= tmp_74;
  
  bodyVar_10 <= (product3_sel0 => repANF_8
                ,product3_sel1 => repANF_7);
  
  zipWith_n_84 : block
    signal n_85 : array_of_signed_32(0 to 4);
    signal n_86 : array_of_signed_32(0 to 4);
  begin
    n_85 <= ds16_24;
    n_86 <= repANF_9;
  
    zipWithZ_n_87 : if tmp_82'length = 0 generate
      tmp_82 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_88 : if tmp_82'length /= 0 generate
      zipWithIter_n_89 : for n_90 in tmp_82'range generate
      begin
        Solver_satPlus_9_83 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_82(n_90)
  ,eta_i1 => n_85(n_90)
  ,eta_i2 => n_86(n_90));
      end generate;
    end generate;
  end block;
  
  repANF_11 <= tmp_82;
  
  ds5_12 <= pTS_i1.product5_sel3;
  
  repANF_13 <= (product2_sel0 => bodyVar_10
               ,product2_sel1 => ds5_12);
  
  repANF_14 <= (product3_sel0 => repANF_11
               ,product3_sel1 => repANF_30);
  
  repANF_15 <= (product2_sel0 => eta_i2
               ,product2_sel1 => ds5_12);
  
  Solver_matrix4d_10_k3_16 : entity Solver_matrix4d_10
    port map
      (x_o   => k3_16
      ,ds_i1 => repANF_13);
  
  repANF_17 <= (product2_sel0 => repANF_14
               ,product2_sel1 => ds5_12);
  
  Solver_matrix4d_10_k1_18 : entity Solver_matrix4d_10
    port map
      (x_o   => k1_18
      ,ds_i1 => repANF_15);
  
  Solver_matrix4d_10_k4_19 : entity Solver_matrix4d_10
    port map
      (x_o   => k4_19
      ,ds_i1 => repANF_17);
  
  zipWith_n_93 : block
    signal n_94 : array_of_signed_32(0 to 4);
    signal n_95 : array_of_signed_32(0 to 4);
  begin
    n_94 <= k3_16;
    n_95 <= k4_19;
  
    zipWithZ_n_96 : if tmp_91'length = 0 generate
      tmp_91 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_97 : if tmp_91'length /= 0 generate
      zipWithIter_n_98 : for n_99 in tmp_91'range generate
      begin
        Solver_satPlus_9_92 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_91(n_99)
  ,eta_i1 => n_94(n_99)
  ,eta_i2 => n_95(n_99));
      end generate;
    end generate;
  end block;
  
  repANF_20 <= tmp_91;
  
  map_n_102 : block
    signal n_103 : array_of_signed_32(0 to 4);
  begin
    n_103 <= repANF_20;
  
    mapZ_n_104 : if tmp_100'length = 0 generate
      tmp_100 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_105 : if tmp_100'length /= 0 generate
      mapIter_n_106 : for n_107 in tmp_100'range generate
      begin
        Solver_satMult_16_101 : entity Solver_satMult_16
  port map
  (topLet_o => tmp_100(n_107)
  ,pTS_i1 => n_103(n_107));
      end generate;
    end generate;
  end block;
  
  repANF_21 <= tmp_100;
  
  zipWith_n_110 : block
    signal n_111 : array_of_signed_32(0 to 4);
    signal n_112 : array_of_signed_32(0 to 4);
  begin
    n_111 <= k1_18;
    n_112 <= k4_19;
  
    zipWithZ_n_113 : if tmp_108'length = 0 generate
      tmp_108 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_114 : if tmp_108'length /= 0 generate
      zipWithIter_n_115 : for n_116 in tmp_108'range generate
      begin
        Solver_satPlus_9_109 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_108(n_116)
  ,eta_i1 => n_111(n_116)
  ,eta_i2 => n_112(n_116));
      end generate;
    end generate;
  end block;
  
  repANF_22 <= tmp_108;
  
  ds7_23 <= eta_i2.product3_sel1;
  
  ds16_24 <= eta_i2.product3_sel0;
  
  zipWith_n_119 : block
    signal n_120 : array_of_signed_32(0 to 4);
    signal n_121 : array_of_signed_32(0 to 4);
  begin
    n_120 <= repANF_22;
    n_121 <= repANF_21;
  
    zipWithZ_n_122 : if tmp_117'length = 0 generate
      tmp_117 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_123 : if tmp_117'length /= 0 generate
      zipWithIter_n_124 : for n_125 in tmp_117'range generate
      begin
        Solver_satPlus_9_118 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_117(n_125)
  ,eta_i1 => n_120(n_125)
  ,eta_i2 => n_121(n_125));
      end generate;
    end generate;
  end block;
  
  repANF_25 <= tmp_117;
  
  tmp_127 <= signed'("00000000001010101010101010101010");
  
  Solver_satMult_4_repANF_26 : entity Solver_satMult_4
    port map
      (topLet_o => repANF_26
      ,eta_i1   => tmp_127
      ,eta_i2   => ds3_27);
  
  ds3_27 <= pTS_i1.product5_sel1;
  
  map_n_130 : block
    signal n_131 : array_of_signed_32(0 to 4);
  begin
    n_131 <= repANF_25;
  
    mapZ_n_132 : if tmp_128'length = 0 generate
      tmp_128 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_133 : if tmp_128'length /= 0 generate
      mapIter_n_134 : for n_135 in tmp_128'range generate
      begin
        Solver_satMult_4_129 : entity Solver_satMult_4
  port map
  (topLet_o => tmp_128(n_135)
  ,eta_i1 => repANF_26
  ,eta_i2 => n_131(n_135));
      end generate;
    end generate;
  end block;
  
  bodyVar_28 <= tmp_128;
  
  ds2_29 <= pTS_i1.product5_sel0;
  
  Solver_satPlus_9_repANF_30 : entity Solver_satPlus_9
    port map
      (bodyVar_o => repANF_30
      ,eta_i1    => ds7_23
      ,eta_i2    => ds3_27);
  
  zipWith_n_138 : block
    signal n_139 : array_of_signed_32(0 to 4);
    signal n_140 : array_of_signed_32(0 to 4);
  begin
    n_139 <= ds16_24;
    n_140 <= bodyVar_28;
  
    zipWithZ_n_141 : if tmp_136'length = 0 generate
      tmp_136 <= (others => (others => 'X'));
    end generate;
  
    zipWithSN_n_142 : if tmp_136'length /= 0 generate
      zipWithIter_n_143 : for n_144 in tmp_136'range generate
      begin
        Solver_satPlus_9_137 : entity Solver_satPlus_9
  port map
  (bodyVar_o => tmp_136(n_144)
  ,eta_i1 => n_139(n_144)
  ,eta_i2 => n_140(n_144));
      end generate;
    end generate;
  end block;
  
  repANF_31 <= tmp_136;
  
  altLet_32 <= (product6_sel0 => repANF_31
               ,product6_sel1 => repANF_30);
  
  altLet_33 <= (product6_sel0 => ds16_24
               ,product6_sel1 => ds7_23);
  
  subjLet_34 <= ds7_23 < ds2_29;
  
  with (subjLet_34) select
    bodyVar_35 <= altLet_32 when (true),
                  altLet_33 when others;
  
  xszm_36 <= bodyVar_35.product6_sel1;
  
  xszm_37 <= bodyVar_35.product6_sel0;
  
  bodyVar_o <= (product3_sel0 => xszm_37
               ,product3_sel1 => xszm_36);
end;
