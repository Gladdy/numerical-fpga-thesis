-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_solveODE_2 is
  port(ds2_i1   : in product5;
       input_i2 : in product0;
       topLet_o : out product6);
end;

architecture structural of Solver_solveODE_2 is
  signal bodyVar_0          : product6;
  signal repANF_1           : product5;
  signal repANF_2           : product1;
  signal repANF_3           : product7;
  signal bodyVar_4          : product8;
  signal repANF_5           : std_logic_vector(0 downto 0);
  signal oulzm_6            : std_logic_vector(31 downto 0);
  signal subjLet_7          : boolean;
  signal altLet_8           : product8;
  signal ds3_9              : product9;
  signal oulzm1_10          : product7;
  signal subjLet_11         : boolean;
  signal altLet_12          : product8;
  signal altLet_13          : product8;
  signal oulzm1_14          : std_logic_vector(0 downto 0);
  signal oulzm1_15          : std_logic_vector(31 downto 0);
  signal subjLet_16         : boolean;
  signal altLet_17          : product9;
  signal i_cs_18            : std_logic_vector(0 downto 0);
  signal subjLet_19         : boolean;
  signal altLet_20          : product8;
  signal altLet_21          : product8;
  signal altLet_22          : product9;
  signal i_c_23             : std_logic_vector(31 downto 0);
  signal i_ca_24            : std_logic_vector(7 downto 0);
  signal systemConstants_25 : product8;
  signal subjLet_26         : boolean;
  signal altLet_27          : product8;
  signal altLet_28          : product8;
  signal ds5_29             : signed(31 downto 0);
  signal ds6_30             : unsigned(31 downto 0);
  signal ds7_31             : array_of_signed_32(0 to 15);
  signal a9_32              : signed(31 downto 0);
  signal subjLet_33         : boolean;
  signal altLet_34          : product9;
  signal ds5_35             : std_logic_vector(0 downto 0);
  signal subjLet_36         : boolean;
  signal ds4_37             : signed(31 downto 0);
  signal altLet_38          : product8;
  signal altLet_39          : product8;
  signal subjLet_40         : boolean;
  signal ds10_41            : std_logic_vector(0 downto 0);
  signal altLet_42          : product9;
  signal ds6_43             : std_logic_vector(31 downto 0);
  signal ds7_44             : std_logic_vector(7 downto 0);
  signal block_45           : std_logic_vector(0 downto 0);
  signal repANF_46          : unsigned(31 downto 0);
  signal altLet_47          : product8;
  signal altLet_48          : product8;
  signal subjLet_49         : boolean;
  signal subjLet_50         : boolean;
  signal altLet_51          : product9;
  signal altLet_52          : product9;
  signal systemState_53     : product7;
  signal altLet_54          : product8;
  signal altLet_55          : product8;
  signal subjLet_56         : boolean;
  signal ds16_57            : unsigned(31 downto 0);
  signal altLet_58          : product9;
  signal repANF_59          : product7;
  signal altLet_60          : product8;
  signal altLet_61          : product9;
  signal ds15_62            : product3;
  signal ds14_63            : std_logic_vector(0 downto 0);
  signal altLet_64          : product9;
  signal altLet_65          : product7;
  signal altLet_66          : product8;
  signal altLet_67          : product9;
  signal ds18_68            : signed(31 downto 0);
  signal subjLet_69         : boolean;
  signal altLet_70          : product9;
  signal altLet_71          : product9;
  signal repANF_72          : product3;
  signal oul_73             : std_logic_vector(31 downto 0);
  signal repANF_74          : integer;
  signal bodyVar_75         : array_of_signed_32(0 to 15);
  signal ds17_76            : array_of_signed_32(0 to 15);
  signal altLet_77          : product9;
  signal repANF_78          : product7;
  signal altLet_79          : product3;
  signal repANF_80          : integer;
  signal repANF_81          : unsigned(31 downto 0);
  signal ds11_82            : std_logic_vector(31 downto 0);
  signal bodyVar_83         : product9;
  signal altLet_84          : product9;
  signal altLet_85          : product7;
  signal bodyVar_86         : array_of_signed_32(0 to 15);
  signal wild7_87           : integer;
  signal altLet_88          : product9;
  signal repANF_89          : std_logic_vector(31 downto 0);
  signal repANF_90          : integer;
  signal repANF_91          : signed(31 downto 0);
  signal ds18_92            : signed(31 downto 0);
  signal ds12_93            : std_logic_vector(7 downto 0);
  signal subjLet_94         : boolean;
  signal altLet_95          : product9;
  signal altLet_96          : product9;
  signal altLet_97          : std_logic_vector(31 downto 0);
  signal wild7_98           : integer;
  signal ds17_99            : array_of_signed_32(0 to 15);
  signal subjLet_100        : boolean;
  signal repANF_101         : product7;
  signal s_step_102         : unsigned(31 downto 0);
  signal c_maxstep_103      : unsigned(31 downto 0);
  signal bodyVar_104        : std_logic_vector(31 downto 0);
  signal repANF_105         : integer;
  signal wild7_106          : integer;
  signal ds13_107           : std_logic_vector(7 downto 0);
  signal altLet_108         : product9;
  signal altLet_109         : product7;
  signal repANF_110         : signed(31 downto 0);
  signal repANF_111         : integer;
  signal repANF_112         : product7;
  signal repANF_113         : product3;
  signal repANF_114         : integer;
  signal altLet_115         : product7;
  signal subjLet_116        : product3;
  signal altLet_117         : product3;
  signal repANF_118         : array_of_signed_32(0 to 15);
  signal tmp_160            : array_of_signed_32(0 to 15);
  signal tmp_169            : array_of_signed_32(0 to 15);
  signal tmp_187            : signed(31 downto 0);
  signal tmp_193            : array_of_signed_32(0 to 15);
begin
  bodyVar_0 <= (product6_sel0 => repANF_1
               ,product6_sel1 => repANF_2);
  
  repANF_1 <= (product5_sel0 => repANF_3
              ,product5_sel1 => bodyVar_4
              ,product5_sel2 => oulzm_6
              ,product5_sel3 => repANF_5);
  
  repANF_2 <= (product1_sel0 => std_logic_vector'("1101")
              ,product1_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product1_sel2 => oulzm_6);
  
  repANF_3 <= oulzm1_10;
  
  with (subjLet_7) select
    bodyVar_4 <= altLet_8 when (true),
                 altLet_12 when others;
  
  repANF_5 <= oulzm1_14;
  
  oulzm_6 <= oulzm1_15;
  
  subjLet_7 <= i_cs_18 = std_logic_vector'("1");
  
  with (subjLet_11) select
    altLet_8 <= altLet_13 when (true),
                altLet_12 when others;
  
  with (subjLet_16) select
    ds3_9 <= altLet_17 when (true),
             altLet_34 when others;
  
  oulzm1_10 <= ds3_9.product9_sel0;
  
  subjLet_11 <= i_ca_24 = std_logic_vector'("00000001");
  
  with (subjLet_7) select
    altLet_12 <= altLet_20 when (true),
                 altLet_27 when others;
  
  altLet_13 <= altLet_21;
  
  oulzm1_14 <= ds3_9.product9_sel2;
  
  oulzm1_15 <= ds3_9.product9_sel1;
  
  subjLet_16 <= i_c_23 = std_logic_vector'("00000000000000000000000000000010");
  
  with (subjLet_7) select
    altLet_17 <= altLet_22 when (true),
                 altLet_34 when others;
  
  i_cs_18 <= ds5_35;
  
  subjLet_19 <= i_ca_24 = std_logic_vector'("00000010");
  
  with (subjLet_19) select
    altLet_20 <= altLet_28 when (true),
                 altLet_27 when others;
  
  altLet_21 <= (product8_sel0 => a9_32
               ,product8_sel1 => ds5_29
               ,product8_sel2 => ds6_30
               ,product8_sel3 => ds7_31);
  
  with (subjLet_33) select
    altLet_22 <= (product9_sel0 => (product7_sel0 => (product3_sel0 => array_of_signed_32'(0 to (16)-1 => (shift_left(signed'("00000000000000000000000000000000"),24)))
                                                     ,product3_sel1 => shift_left(signed'("00000000000000000000000000000000"),24))
                                   ,product7_sel1 => unsigned'("11111111111111111111111111111111"))
                 ,product9_sel1 => std_logic_vector'("00000000000000000000000000000000")
                 ,product9_sel2 => std_logic_vector'("0")) when (true),
                 altLet_34 when others;
  
  i_c_23 <= ds6_43;
  
  i_ca_24 <= ds7_44;
  
  systemConstants_25 <= ds2_i1.product5_sel1;
  
  subjLet_26 <= i_ca_24 = std_logic_vector'("00000011");
  
  with (subjLet_7) select
    altLet_27 <= altLet_38 when (true),
                 altLet_47 when others;
  
  altLet_28 <= altLet_39;
  
  ds5_29 <= systemConstants_25.product8_sel1;
  
  ds6_30 <= systemConstants_25.product8_sel2;
  
  ds7_31 <= systemConstants_25.product8_sel3;
  
  a9_32 <= signed(i_c_23);
  
  subjLet_33 <= i_ca_24 = std_logic_vector'("00000000");
  
  altLet_34 <= altLet_42;
  
  ds5_35 <= input_i2.product0_sel2;
  
  subjLet_36 <= i_ca_24 >= std_logic_vector'("00000100");
  
  ds4_37 <= systemConstants_25.product8_sel0;
  
  with (subjLet_26) select
    altLet_38 <= altLet_48 when (true),
                 altLet_47 when others;
  
  altLet_39 <= (product8_sel0 => ds4_37
               ,product8_sel1 => a9_32
               ,product8_sel2 => ds6_30
               ,product8_sel3 => ds7_31);
  
  subjLet_40 <= i_c_23 = std_logic_vector'("00000000000000000000000000000001");
  
  ds10_41 <= input_i2.product0_sel6;
  
  with (subjLet_50) select
    altLet_42 <= altLet_52 when (true),
                 altLet_51 when others;
  
  ds6_43 <= input_i2.product0_sel3;
  
  ds7_44 <= input_i2.product0_sel4;
  
  block_45 <= ds2_i1.product5_sel3;
  
  repANF_46 <= unsigned(i_c_23);
  
  with (subjLet_7) select
    altLet_47 <= altLet_54 when (true),
                 systemConstants_25 when others;
  
  altLet_48 <= altLet_55;
  
  subjLet_49 <= block_45 = std_logic_vector'("1");
  
  subjLet_50 <= ds10_41 = std_logic_vector'("1");
  
  with (subjLet_40) select
    altLet_51 <= altLet_58 when (true),
                 altLet_70 when others;
  
  altLet_52 <= (product9_sel0 => repANF_59
               ,product9_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product9_sel2 => block_45);
  
  systemState_53 <= ds2_i1.product5_sel0;
  
  with (subjLet_36) select
    altLet_54 <= altLet_60 when (true),
                 systemConstants_25 when others;
  
  altLet_55 <= (product8_sel0 => ds4_37
               ,product8_sel1 => ds5_29
               ,product8_sel2 => repANF_46
               ,product8_sel3 => ds7_31);
  
  subjLet_56 <= block_45 = std_logic_vector'("0");
  
  ds16_57 <= systemState_53.product7_sel1;
  
  with (subjLet_7) select
    altLet_58 <= altLet_64 when (true),
                 altLet_70 when others;
  
  repANF_59 <= altLet_65;
  
  altLet_60 <= altLet_66;
  
  altLet_61 <= (product9_sel0 => systemState_53
               ,product9_sel1 => oul_73
               ,product9_sel2 => block_45);
  
  ds15_62 <= systemState_53.product7_sel0;
  
  ds14_63 <= input_i2.product0_sel10;
  
  with (subjLet_33) select
    altLet_64 <= altLet_71 when (true),
                 altLet_70 when others;
  
  altLet_65 <= (product7_sel0 => repANF_72
               ,product7_sel1 => ds16_57);
  
  altLet_66 <= (product8_sel0 => ds4_37
               ,product8_sel1 => ds5_29
               ,product8_sel2 => ds6_30
               ,product8_sel3 => bodyVar_75);
  
  with (subjLet_100) select
    altLet_67 <= altLet_108 when (true),
                 altLet_61 when others;
  
  ds18_68 <= ds15_62.product3_sel1;
  
  subjLet_69 <= ds14_63 = std_logic_vector'("1");
  
  with (subjLet_49) select
    altLet_70 <= altLet_77 when (true),
                 bodyVar_83 when others;
  
  altLet_71 <= (product9_sel0 => repANF_78
               ,product9_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product9_sel2 => std_logic_vector'("0"));
  
  repANF_72 <= altLet_79;
  
  oul_73 <= ds2_i1.product5_sel2;
  
  repANF_74 <= to_integer(unsigned(i_ca_24));
  
  replaceVec_n_161 : block
    signal n_162 : array_of_signed_32(0 to 15);
    signal n_163 : integer;
    signal n_164 : signed(31 downto 0);
  begin
    n_162 <= ds7_31;
    n_163 <= repANF_80;
    n_164 <= a9_32;
    process(n_162,n_163,n_164)
      variable n_165 : array_of_signed_32(0 to 15);
    begin
      n_165 := n_162;
      -- pragma translate_off
      if n_163 < n_165'low or n_163 > n_165'high then
        assert false report ("Index: " & integer'image(n_163) & ", is out of bounds: " & integer'image(n_162'low) & " to " & integer'image(n_162'high)) severity warning;
        n_165 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_165(n_163) := n_164;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_160 <= n_165;
    end process;
  end block;
  
  bodyVar_75 <= tmp_160;
  
  ds17_76 <= ds15_62.product3_sel0;
  
  with (subjLet_69) select
    altLet_77 <= altLet_84 when (true),
                 bodyVar_83 when others;
  
  repANF_78 <= altLet_85;
  
  altLet_79 <= (product3_sel0 => bodyVar_86
               ,product3_sel1 => ds18_68);
  
  repANF_80 <= wild7_87;
  
  repANF_81 <= s_step_102 + unsigned'("00000000000000000000000000000001");
  
  ds11_82 <= input_i2.product0_sel7;
  
  with (subjLet_56) select
    bodyVar_83 <= altLet_88 when (true),
                  altLet_95 when others;
  
  altLet_84 <= (product9_sel0 => systemState_53
               ,product9_sel1 => repANF_89
               ,product9_sel2 => block_45);
  
  altLet_85 <= (product7_sel0 => ds15_62
               ,product7_sel1 => unsigned'("00000000000000000000000000000000"));
  
  replaceVec_n_170 : block
    signal n_171 : array_of_signed_32(0 to 15);
    signal n_172 : integer;
    signal n_173 : signed(31 downto 0);
  begin
    n_171 <= ds17_76;
    n_172 <= repANF_90;
    n_173 <= repANF_91;
    process(n_171,n_172,n_173)
      variable n_174 : array_of_signed_32(0 to 15);
    begin
      n_174 := n_171;
      -- pragma translate_off
      if n_172 < n_174'low or n_172 > n_174'high then
        assert false report ("Index: " & integer'image(n_172) & ", is out of bounds: " & integer'image(n_171'low) & " to " & integer'image(n_171'high)) severity warning;
        n_174 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_174(n_172) := n_173;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_169 <= n_174;
    end process;
  end block;
  
  bodyVar_86 <= tmp_169;
  
  wild7_87 <= repANF_74;
  
  with (subjLet_94) select
    altLet_88 <= altLet_96 when (true),
                 altLet_95 when others;
  
  repANF_89 <= altLet_97;
  
  repANF_90 <= wild7_98;
  
  repANF_91 <= signed(ds11_82);
  
  ds18_92 <= subjLet_116.product3_sel1;
  
  ds12_93 <= input_i2.product0_sel8;
  
  subjLet_94 <= s_step_102 < c_maxstep_103;
  
  with (subjLet_56) select
    altLet_95 <= altLet_67 when (true),
                 altLet_61 when others;
  
  altLet_96 <= (product9_sel0 => repANF_101
               ,product9_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product9_sel2 => block_45);
  
  altLet_97 <= bodyVar_104;
  
  wild7_98 <= repANF_105;
  
  ds17_99 <= subjLet_116.product3_sel0;
  
  subjLet_100 <= s_step_102 >= c_maxstep_103;
  
  repANF_101 <= altLet_109;
  
  s_step_102 <= ds16_57;
  
  c_maxstep_103 <= ds6_30;
  
  bodyVar_104 <= std_logic_vector(repANF_110);
  
  repANF_105 <= to_integer(unsigned(ds12_93));
  
  wild7_106 <= repANF_111;
  
  ds13_107 <= input_i2.product0_sel9;
  
  altLet_108 <= (product9_sel0 => repANF_112
                ,product9_sel1 => std_logic_vector(unsigned'("11111111111111111111111111111111"))
                ,product9_sel2 => std_logic_vector'("1"));
  
  altLet_109 <= (product7_sel0 => repANF_113
                ,product7_sel1 => repANF_81);
  
  indexVec_n_188 : block
    signal n_189 : array_of_signed_32(0 to 15);
    signal n_190 : integer;
  begin
    n_189 <= ds17_76;
    n_190 <= repANF_114;
    -- pragma translate_off
    process (n_189,n_190)
    begin
      if n_190 < n_189'low or n_190 > n_189'high then
        assert false report ("Index: " & integer'image(n_190) & ", is out of bounds: " & integer'image(n_189'low) & " to " & integer'image(n_189'high)) severity warning;
        tmp_187 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_187 <= n_189(n_190);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_110 <= tmp_187;
  
  repANF_111 <= to_integer(unsigned(ds13_107));
  
  repANF_112 <= altLet_115;
  
  repANF_113 <= altLet_117;
  
  repANF_114 <= wild7_106;
  
  altLet_115 <= (product7_sel0 => ds15_62
                ,product7_sel1 => unsigned'("11111111111111111111111111111111"));
  
  Solver_euler_3_subjLet_116 : entity Solver_euler_3
    port map
      (bodyVar_o => subjLet_116
      ,pTS_i1    => systemConstants_25
      ,eta_i2    => ds15_62);
  
  altLet_117 <= (product3_sel0 => repANF_118
                ,product3_sel1 => ds18_92);
  
  replaceVec_n_194 : block
    signal n_195 : array_of_signed_32(0 to 15);
    signal n_196 : integer;
    signal n_197 : signed(31 downto 0);
  begin
    n_195 <= ds17_99;
    n_196 <= 15;
    n_197 <= ds18_92;
    process(n_195,n_196,n_197)
      variable n_198 : array_of_signed_32(0 to 15);
    begin
      n_198 := n_195;
      -- pragma translate_off
      if n_196 < n_198'low or n_196 > n_198'high then
        assert false report ("Index: " & integer'image(n_196) & ", is out of bounds: " & integer'image(n_195'low) & " to " & integer'image(n_195'high)) severity warning;
        n_198 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_198(n_196) := n_197;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_193 <= n_198;
    end process;
  end block;
  
  repANF_118 <= tmp_193;
  
  topLet_o <= bodyVar_0;
end;
