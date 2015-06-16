-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_forwardLEDS_2 is
  port(ds1_i1   : in product2;
       input_i2 : in product0;
       topLet_o : out product3);
end;

architecture structural of Solver_forwardLEDS_2 is
  signal bodyVar_0           : product3;
  signal repANF_1            : product2;
  signal repANF_2            : product1;
  signal repANF_3            : product4;
  signal repANF_4            : product5;
  signal repANF_5            : std_logic_vector(0 downto 0);
  signal repANF_6            : std_logic_vector(3 downto 0);
  signal oulzm_7             : std_logic_vector(31 downto 0);
  signal subjLet_8           : boolean;
  signal altLet_9            : product5;
  signal altLet_10           : std_logic_vector(3 downto 0);
  signal ds2_11              : product6;
  signal oulzm1_12           : product4;
  signal subjLet_13          : boolean;
  signal altLet_14           : product5;
  signal oulzm1_15           : std_logic_vector(0 downto 0);
  signal ds3_16              : std_logic_vector(3 downto 0);
  signal oulzm1_17           : std_logic_vector(31 downto 0);
  signal bodyVar_18          : product6;
  signal i_cs_19             : std_logic_vector(0 downto 0);
  signal systemConstants_20  : product5;
  signal subjLet_21          : boolean;
  signal altLet_22           : product5;
  signal bodyVar_23          : product6;
  signal subjLet_24          : boolean;
  signal altLet_25           : product6;
  signal i_ca_26             : std_logic_vector(7 downto 0);
  signal subjLet_27          : boolean;
  signal altLet_28           : product5;
  signal altLet_29           : product5;
  signal subjLet_30          : boolean;
  signal altLet_31           : product6;
  signal repANF_32           : product4;
  signal repANF_33           : std_logic_vector(31 downto 0);
  signal ds9_34              : std_logic_vector(0 downto 0);
  signal ds4_35              : std_logic_vector(0 downto 0);
  signal block_36            : std_logic_vector(0 downto 0);
  signal subjLet_37          : boolean;
  signal repANF_38           : unsigned(31 downto 0);
  signal ds4_39              : unsigned(31 downto 0);
  signal ds5_40              : unsigned(31 downto 0);
  signal ds6_41              : array_of_unsigned_32(0 to 255);
  signal altLet_42           : product5;
  signal altLet_43           : product5;
  signal subjLet_44          : boolean;
  signal altLet_45           : product6;
  signal altLet_46           : product4;
  signal s_countzm_47        : unsigned(31 downto 0);
  signal i_c_48              : std_logic_vector(31 downto 0);
  signal ds6_49              : std_logic_vector(7 downto 0);
  signal systemState_50      : product4;
  signal subjLet_51          : boolean;
  signal ds3_52              : unsigned(31 downto 0);
  signal altLet_53           : product5;
  signal altLet_54           : product5;
  signal subjLet_55          : boolean;
  signal subjLet_56          : boolean;
  signal altLet_57           : product6;
  signal altLet_58           : product6;
  signal repANF_59           : product7;
  signal ds16_60             : unsigned(31 downto 0);
  signal altLet_61           : unsigned(31 downto 0);
  signal altLet_62           : product5;
  signal altLet_63           : product5;
  signal altLet_64           : product6;
  signal altLet_65           : product6;
  signal repANF_66           : product4;
  signal altLet_67           : product7;
  signal ds15_68             : unsigned(31 downto 0);
  signal s_odestate_69       : product7;
  signal ds13_70             : std_logic_vector(0 downto 0);
  signal ds5_71              : std_logic_vector(31 downto 0);
  signal altLet_72           : product5;
  signal altLet_73           : product5;
  signal altLet_74           : product6;
  signal bodyVar_75          : product6;
  signal altLet_76           : product6;
  signal altLet_77           : product4;
  signal bodyVar_78          : array_of_unsigned_32(0 to 255);
  signal ds18_79             : unsigned(31 downto 0);
  signal oul_80              : std_logic_vector(31 downto 0);
  signal altLet_81           : product5;
  signal altLet_82           : product5;
  signal altLet_83           : product6;
  signal bodyVar_84          : std_logic_vector(31 downto 0);
  signal ds14_85             : product7;
  signal repANF_86           : integer;
  signal repANF_87           : unsigned(31 downto 0);
  signal s_valueVector_88    : array_of_unsigned_32(0 to 255);
  signal altLet_89           : product5;
  signal repANF_90           : unsigned(31 downto 0);
  signal ds15_91             : unsigned(31 downto 0);
  signal bodyVar_92          : product6;
  signal subjLet_93          : boolean;
  signal altLet_94           : product6;
  signal repANF_95           : unsigned(31 downto 0);
  signal wild5_96            : integer;
  signal ds10_97             : std_logic_vector(31 downto 0);
  signal repANF_98           : integer;
  signal altLet_99           : product5;
  signal repANF_100          : array_of_unsigned_32(0 to 255);
  signal repANF_101          : integer;
  signal subjLet_102         : boolean;
  signal repANF_103          : product4;
  signal repANF_104          : std_logic_vector(31 downto 0);
  signal s_substep_105       : unsigned(31 downto 0);
  signal c_substep_106       : unsigned(31 downto 0);
  signal repANF_107          : integer;
  signal repANF_108          : integer;
  signal ds14_109            : array_of_unsigned_32(0 to 255);
  signal bodyVar_110         : array_of_unsigned_32(0 to 255);
  signal altLet_111          : product6;
  signal altLet_112          : product4;
  signal altLet_113          : std_logic_vector(31 downto 0);
  signal s_odestate_upzm_114 : product7;
  signal wild5_115           : integer;
  signal ds11_116            : std_logic_vector(7 downto 0);
  signal ds12_117            : std_logic_vector(7 downto 0);
  signal repANF_118          : integer;
  signal repANF_119          : product4;
  signal altLet_120          : product7;
  signal wild5_121           : integer;
  signal altLet_122          : product4;
  signal tmp_154             : array_of_unsigned_32(0 to 255);
  signal tmp_165             : unsigned(31 downto 0);
  signal tmp_171             : array_of_unsigned_32(0 to 255);
  signal tmp_182             : array_of_unsigned_32(0 to 255);
begin
  bodyVar_0 <= (product3_sel0 => repANF_1
               ,product3_sel1 => repANF_2);
  
  repANF_1 <= (product2_sel0 => repANF_3
              ,product2_sel1 => repANF_4
              ,product2_sel2 => oulzm_7
              ,product2_sel3 => repANF_5);
  
  repANF_2 <= (product1_sel0 => repANF_6
              ,product1_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product1_sel2 => oulzm_7);
  
  repANF_3 <= oulzm1_12;
  
  with (subjLet_8) select
    repANF_4 <= altLet_9 when (true),
                altLet_14 when others;
  
  repANF_5 <= oulzm1_15;
  
  repANF_6 <= altLet_10;
  
  oulzm_7 <= oulzm1_17;
  
  subjLet_8 <= i_cs_19 = std_logic_vector'("1");
  
  with (subjLet_13) select
    altLet_9 <= systemConstants_20 when (true),
                altLet_14 when others;
  
  altLet_10 <= not ds3_16;
  
  ds2_11 <= bodyVar_18;
  
  oulzm1_12 <= ds2_11.product6_sel0;
  
  subjLet_13 <= i_ca_26 = std_logic_vector'("00000000");
  
  with (subjLet_8) select
    altLet_14 <= altLet_22 when (true),
                 altLet_28 when others;
  
  oulzm1_15 <= ds2_11.product6_sel2;
  
  ds3_16 <= input_i2.product0_sel0;
  
  oulzm1_17 <= ds2_11.product6_sel1;
  
  with (subjLet_24) select
    bodyVar_18 <= bodyVar_23 when (true),
                  altLet_25 when others;
  
  i_cs_19 <= ds4_35;
  
  systemConstants_20 <= ds1_i1.product2_sel1;
  
  subjLet_21 <= i_ca_26 = std_logic_vector'("00000001");
  
  with (subjLet_21) select
    altLet_22 <= altLet_29 when (true),
                 altLet_28 when others;
  
  bodyVar_23 <= (product6_sel0 => repANF_32
                ,product6_sel1 => repANF_33
                ,product6_sel2 => block_36);
  
  subjLet_24 <= ds9_34 = std_logic_vector'("1");
  
  with (subjLet_30) select
    altLet_25 <= altLet_31 when (true),
                 altLet_57 when others;
  
  i_ca_26 <= ds6_49;
  
  subjLet_27 <= i_ca_26 = std_logic_vector'("00000010");
  
  with (subjLet_8) select
    altLet_28 <= altLet_42 when (true),
                 altLet_53 when others;
  
  altLet_29 <= altLet_43;
  
  subjLet_30 <= i_c_48 = std_logic_vector'("00000000000000000000000000000001");
  
  with (subjLet_8) select
    altLet_31 <= altLet_45 when (true),
                 altLet_57 when others;
  
  repANF_32 <= altLet_46;
  
  repANF_33 <= std_logic_vector(s_countzm_47);
  
  ds9_34 <= input_i2.product0_sel6;
  
  ds4_35 <= input_i2.product0_sel2;
  
  block_36 <= ds1_i1.product2_sel3;
  
  subjLet_37 <= i_ca_26 = std_logic_vector'("00000011");
  
  repANF_38 <= unsigned(i_c_48);
  
  ds4_39 <= systemConstants_20.product5_sel1;
  
  ds5_40 <= systemConstants_20.product5_sel2;
  
  ds6_41 <= systemConstants_20.product5_sel3;
  
  with (subjLet_27) select
    altLet_42 <= altLet_54 when (true),
                 altLet_53 when others;
  
  altLet_43 <= (product5_sel0 => repANF_38
               ,product5_sel1 => ds4_39
               ,product5_sel2 => ds5_40
               ,product5_sel3 => ds6_41);
  
  subjLet_44 <= block_36 = std_logic_vector'("1");
  
  with (subjLet_13) select
    altLet_45 <= altLet_58 when (true),
                 altLet_57 when others;
  
  altLet_46 <= (product4_sel0 => repANF_59
               ,product4_sel1 => s_countzm_47
               ,product4_sel2 => ds16_60);
  
  s_countzm_47 <= altLet_61;
  
  i_c_48 <= ds5_71;
  
  ds6_49 <= input_i2.product0_sel4;
  
  systemState_50 <= ds1_i1.product2_sel0;
  
  subjLet_51 <= i_ca_26 >= std_logic_vector'("00000100");
  
  ds3_52 <= systemConstants_20.product5_sel0;
  
  with (subjLet_8) select
    altLet_53 <= altLet_62 when (true),
                 altLet_72 when others;
  
  altLet_54 <= altLet_63;
  
  subjLet_55 <= block_36 = std_logic_vector'("0");
  
  subjLet_56 <= ds13_70 = std_logic_vector'("1");
  
  with (subjLet_44) select
    altLet_57 <= altLet_65 when (true),
                 bodyVar_75 when others;
  
  altLet_58 <= (product6_sel0 => repANF_66
               ,product6_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product6_sel2 => std_logic_vector'("0"));
  
  repANF_59 <= altLet_67;
  
  ds16_60 <= systemState_50.product4_sel2;
  
  altLet_61 <= ds15_68 + unsigned'("00000000000000000000000000000001");
  
  with (subjLet_37) select
    altLet_62 <= altLet_73 when (true),
                 altLet_72 when others;
  
  altLet_63 <= (product5_sel0 => ds3_52
               ,product5_sel1 => repANF_38
               ,product5_sel2 => ds5_40
               ,product5_sel3 => ds6_41);
  
  altLet_64 <= (product6_sel0 => systemState_50
               ,product6_sel1 => oul_80
               ,product6_sel2 => block_36);
  
  with (subjLet_56) select
    altLet_65 <= altLet_76 when (true),
                 bodyVar_75 when others;
  
  repANF_66 <= altLet_77;
  
  altLet_67 <= (product7_sel0 => bodyVar_78
               ,product7_sel1 => ds18_79);
  
  ds15_68 <= systemState_50.product4_sel1;
  
  s_odestate_69 <= ds14_85;
  
  ds13_70 <= input_i2.product0_sel10;
  
  ds5_71 <= input_i2.product0_sel3;
  
  with (subjLet_8) select
    altLet_72 <= altLet_81 when (true),
                 systemConstants_20 when others;
  
  altLet_73 <= altLet_82;
  
  with (subjLet_102) select
    altLet_74 <= altLet_111 when (true),
                 altLet_64 when others;
  
  with (subjLet_55) select
    bodyVar_75 <= altLet_83 when (true),
                  altLet_94 when others;
  
  altLet_76 <= (product6_sel0 => systemState_50
               ,product6_sel1 => bodyVar_84
               ,product6_sel2 => block_36);
  
  altLet_77 <= (product4_sel0 => ds14_85
               ,product4_sel1 => ds15_68
               ,product4_sel2 => unsigned'("00000000000000000000000000000000"));
  
  replaceVec_n_155 : block
    signal n_156 : array_of_unsigned_32(0 to 255);
    signal n_157 : integer;
    signal n_158 : unsigned(31 downto 0);
  begin
    n_156 <= s_valueVector_88;
    n_157 <= repANF_86;
    n_158 <= repANF_87;
    process(n_156,n_157,n_158)
      variable n_159 : array_of_unsigned_32(0 to 255);
    begin
      n_159 := n_156;
      -- pragma translate_off
      if n_157 < n_159'low or n_157 > n_159'high then
        assert false report ("Index: " & integer'image(n_157) & ", is out of bounds: " & integer'image(n_156'low) & " to " & integer'image(n_156'high)) severity warning;
        n_159 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_159(n_157) := n_158;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_154 <= n_159;
    end process;
  end block;
  
  bodyVar_78 <= tmp_154;
  
  ds18_79 <= s_odestate_69.product7_sel1;
  
  oul_80 <= ds1_i1.product2_sel2;
  
  with (subjLet_51) select
    altLet_81 <= altLet_89 when (true),
                 systemConstants_20 when others;
  
  altLet_82 <= (product5_sel0 => ds3_52
               ,product5_sel1 => ds4_39
               ,product5_sel2 => repANF_38
               ,product5_sel3 => ds6_41);
  
  with (subjLet_93) select
    altLet_83 <= bodyVar_92 when (true),
                 altLet_94 when others;
  
  bodyVar_84 <= std_logic_vector(repANF_95);
  
  ds14_85 <= systemState_50.product4_sel0;
  
  repANF_86 <= wild5_96;
  
  repANF_87 <= unsigned(ds10_97);
  
  s_valueVector_88 <= ds14_109;
  
  altLet_89 <= altLet_99;
  
  repANF_90 <= s_substep_105 + unsigned'("00000000000000000000000000000001");
  
  ds15_91 <= s_odestate_upzm_114.product7_sel1;
  
  bodyVar_92 <= (product6_sel0 => repANF_103
                ,product6_sel1 => repANF_104
                ,product6_sel2 => block_36);
  
  subjLet_93 <= s_substep_105 < c_substep_106;
  
  with (subjLet_55) select
    altLet_94 <= altLet_74 when (true),
                 altLet_64 when others;
  
  indexVec_n_166 : block
    signal n_167 : array_of_unsigned_32(0 to 255);
    signal n_168 : integer;
  begin
    n_167 <= s_valueVector_88;
    n_168 <= repANF_107;
    -- pragma translate_off
    process (n_167,n_168)
    begin
      if n_168 < n_167'low or n_168 > n_167'high then
        assert false report ("Index: " & integer'image(n_168) & ", is out of bounds: " & integer'image(n_167'low) & " to " & integer'image(n_167'high)) severity warning;
        tmp_165 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_165 <= n_167(n_168);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_95 <= tmp_165;
  
  wild5_96 <= repANF_108;
  
  ds10_97 <= input_i2.product0_sel7;
  
  repANF_98 <= to_integer(unsigned(i_ca_26));
  
  altLet_99 <= (product5_sel0 => ds3_52
               ,product5_sel1 => ds4_39
               ,product5_sel2 => ds5_40
               ,product5_sel3 => bodyVar_110);
  
  map_n_173 : block
    signal n_174 : array_of_unsigned_32(0 to 255);
  begin
    n_174 <= s_valueVector_88;
  
    mapZ_n_175 : if tmp_171'length = 0 generate
      tmp_171 <= (others => (others => 'X'));
    end generate;
  
    mapSN_n_176 : if tmp_171'length /= 0 generate
      mapIter_n_177 : for n_178 in tmp_171'range generate
      begin
        Solver_forwardLEDS14_3_172 : entity Solver_forwardLEDS14_3
  port map
  (topLet_o => tmp_171(n_178)
  ,ds1_i1 => n_174(n_178));
      end generate;
    end generate;
  end block;
  
  repANF_100 <= tmp_171;
  
  repANF_101 <= to_integer(unsigned(ds12_117));
  
  subjLet_102 <= s_substep_105 >= c_substep_106;
  
  repANF_103 <= altLet_112;
  
  repANF_104 <= altLet_113;
  
  s_substep_105 <= ds16_60;
  
  c_substep_106 <= ds5_40;
  
  repANF_107 <= wild5_115;
  
  repANF_108 <= to_integer(unsigned(ds11_116));
  
  ds14_109 <= s_odestate_69.product7_sel0;
  
  replaceVec_n_183 : block
    signal n_184 : array_of_unsigned_32(0 to 255);
    signal n_185 : integer;
    signal n_186 : unsigned(31 downto 0);
  begin
    n_184 <= ds6_41;
    n_185 <= repANF_118;
    n_186 <= repANF_38;
    process(n_184,n_185,n_186)
      variable n_187 : array_of_unsigned_32(0 to 255);
    begin
      n_187 := n_184;
      -- pragma translate_off
      if n_185 < n_187'low or n_185 > n_187'high then
        assert false report ("Index: " & integer'image(n_185) & ", is out of bounds: " & integer'image(n_184'low) & " to " & integer'image(n_184'high)) severity warning;
        n_187 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_187(n_185) := n_186;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_182 <= n_187;
    end process;
  end block;
  
  bodyVar_110 <= tmp_182;
  
  altLet_111 <= (product6_sel0 => repANF_119
                ,product6_sel1 => std_logic_vector(unsigned'("11111111111111111111111111111111"))
                ,product6_sel2 => std_logic_vector'("1"));
  
  altLet_112 <= (product4_sel0 => s_odestate_upzm_114
                ,product4_sel1 => ds15_68
                ,product4_sel2 => repANF_90);
  
  altLet_113 <= std_logic_vector(ds15_91);
  
  s_odestate_upzm_114 <= altLet_120;
  
  wild5_115 <= repANF_101;
  
  ds11_116 <= input_i2.product0_sel8;
  
  ds12_117 <= input_i2.product0_sel9;
  
  repANF_118 <= wild5_121;
  
  repANF_119 <= altLet_122;
  
  altLet_120 <= (product7_sel0 => repANF_100
                ,product7_sel1 => ds18_79);
  
  wild5_121 <= repANF_98;
  
  altLet_122 <= (product4_sel0 => ds14_85
                ,product4_sel1 => ds15_68
                ,product4_sel2 => unsigned'("11111111111111111111111111111111"));
  
  topLet_o <= bodyVar_0;
end;
