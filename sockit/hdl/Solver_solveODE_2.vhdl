-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_solveODE_2 is
  port(ds1_i1   : in product5;
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
  signal ds2_9              : product10;
  signal oulzm1_10          : product7;
  signal subjLet_11         : boolean;
  signal altLet_12          : product8;
  signal altLet_13          : product8;
  signal oulzm1_14          : std_logic_vector(0 downto 0);
  signal oulzm1_15          : std_logic_vector(31 downto 0);
  signal subjLet_16         : boolean;
  signal altLet_17          : product10;
  signal i_cs_18            : std_logic_vector(0 downto 0);
  signal subjLet_19         : boolean;
  signal altLet_20          : product8;
  signal altLet_21          : product8;
  signal altLet_22          : product10;
  signal i_c_23             : std_logic_vector(31 downto 0);
  signal i_ca_24            : std_logic_vector(7 downto 0);
  signal systemConstants_25 : product8;
  signal subjLet_26         : boolean;
  signal altLet_27          : product8;
  signal altLet_28          : product8;
  signal ds4_29             : signed(31 downto 0);
  signal ds5_30             : unsigned(31 downto 0);
  signal ds6_31             : array_of_signed_32(0 to 19);
  signal a9_32              : signed(31 downto 0);
  signal subjLet_33         : boolean;
  signal altLet_34          : product10;
  signal ds4_35             : std_logic_vector(0 downto 0);
  signal subjLet_36         : boolean;
  signal ds3_37             : signed(31 downto 0);
  signal altLet_38          : product8;
  signal altLet_39          : product8;
  signal subjLet_40         : boolean;
  signal ds9_41             : std_logic_vector(0 downto 0);
  signal altLet_42          : product10;
  signal ds5_43             : std_logic_vector(31 downto 0);
  signal ds6_44             : std_logic_vector(7 downto 0);
  signal repANF_45          : unsigned(31 downto 0);
  signal altLet_46          : product8;
  signal altLet_47          : product8;
  signal subjLet_48         : boolean;
  signal subjLet_49         : boolean;
  signal altLet_50          : product10;
  signal altLet_51          : product10;
  signal systemState_52     : product7;
  signal altLet_53          : product8;
  signal altLet_54          : product8;
  signal subjLet_55         : boolean;
  signal ds15_56            : unsigned(31 downto 0);
  signal altLet_57          : product10;
  signal repANF_58          : product7;
  signal block_59           : std_logic_vector(0 downto 0);
  signal altLet_60          : product8;
  signal altLet_61          : product10;
  signal ds14_62            : product3;
  signal ds13_63            : std_logic_vector(0 downto 0);
  signal altLet_64          : product10;
  signal altLet_65          : product7;
  signal altLet_66          : product8;
  signal altLet_67          : product10;
  signal ds17_68            : signed(31 downto 0);
  signal subjLet_69         : boolean;
  signal altLet_70          : product10;
  signal altLet_71          : product10;
  signal repANF_72          : product3;
  signal oul_73             : std_logic_vector(31 downto 0);
  signal repANF_74          : integer;
  signal bodyVar_75         : array_of_signed_32(0 to 19);
  signal ds16_76            : array_of_signed_32(0 to 4);
  signal altLet_77          : product10;
  signal repANF_78          : product7;
  signal altLet_79          : product3;
  signal repANF_80          : integer;
  signal repANF_81          : unsigned(31 downto 0);
  signal ds10_82            : std_logic_vector(31 downto 0);
  signal bodyVar_83         : product10;
  signal altLet_84          : product10;
  signal altLet_85          : product7;
  signal bodyVar_86         : array_of_signed_32(0 to 4);
  signal wild7_87           : integer;
  signal altLet_88          : product10;
  signal repANF_89          : std_logic_vector(31 downto 0);
  signal repANF_90          : integer;
  signal repANF_91          : signed(31 downto 0);
  signal ds17_92            : signed(31 downto 0);
  signal ds11_93            : std_logic_vector(7 downto 0);
  signal subjLet_94         : boolean;
  signal altLet_95          : product10;
  signal altLet_96          : product10;
  signal altLet_97          : std_logic_vector(31 downto 0);
  signal wild7_98           : integer;
  signal ds16_99            : array_of_signed_32(0 to 4);
  signal subjLet_100        : boolean;
  signal repANF_101         : product7;
  signal s_step_102         : unsigned(31 downto 0);
  signal c_maxstep_103      : unsigned(31 downto 0);
  signal bodyVar_104        : std_logic_vector(31 downto 0);
  signal repANF_105         : integer;
  signal wild7_106          : integer;
  signal ds12_107           : std_logic_vector(7 downto 0);
  signal altLet_108         : product10;
  signal altLet_109         : product7;
  signal repANF_110         : signed(31 downto 0);
  signal repANF_111         : integer;
  signal repANF_112         : product7;
  signal repANF_113         : product3;
  signal repANF_114         : integer;
  signal altLet_115         : product7;
  signal subjLet_116        : product3;
  signal altLet_117         : product3;
  signal repANF_118         : array_of_signed_32(0 to 4);
  signal tmp_161            : array_of_signed_32(0 to 19);
  signal tmp_170            : array_of_signed_32(0 to 4);
  signal tmp_188            : signed(31 downto 0);
  signal tmp_194            : array_of_signed_32(0 to 4);
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
    ds2_9 <= altLet_17 when (true),
             altLet_34 when others;
  
  oulzm1_10 <= ds2_9.product10_sel0;
  
  subjLet_11 <= i_ca_24 = std_logic_vector'("00000001");
  
  with (subjLet_7) select
    altLet_12 <= altLet_20 when (true),
                 altLet_27 when others;
  
  altLet_13 <= altLet_21;
  
  oulzm1_14 <= ds2_9.product10_sel2;
  
  oulzm1_15 <= ds2_9.product10_sel1;
  
  subjLet_16 <= i_c_23 = std_logic_vector'("00000000000000000000000000000010");
  
  with (subjLet_7) select
    altLet_17 <= altLet_22 when (true),
                 altLet_34 when others;
  
  i_cs_18 <= ds4_35;
  
  subjLet_19 <= i_ca_24 = std_logic_vector'("00000010");
  
  with (subjLet_19) select
    altLet_20 <= altLet_28 when (true),
                 altLet_27 when others;
  
  altLet_21 <= (product8_sel0 => a9_32
               ,product8_sel1 => ds4_29
               ,product8_sel2 => ds5_30
               ,product8_sel3 => ds6_31);
  
  with (subjLet_33) select
    altLet_22 <= (product10_sel0 => (product7_sel0 => (product3_sel0 => array_of_signed_32'(0 to (5)-1 => (shift_left(signed'("00000000000000000000000000000000"),24)))
                                                      ,product3_sel1 => shift_left(signed'("00000000000000000000000000000000"),24))
                                    ,product7_sel1 => unsigned'("11111111111111111111111111111111"))
                 ,product10_sel1 => std_logic_vector'("00000000000000000000000000000000")
                 ,product10_sel2 => std_logic_vector'("0")) when (true),
                 altLet_34 when others;
  
  i_c_23 <= ds5_43;
  
  i_ca_24 <= ds6_44;
  
  systemConstants_25 <= ds1_i1.product5_sel1;
  
  subjLet_26 <= i_ca_24 = std_logic_vector'("00000011");
  
  with (subjLet_7) select
    altLet_27 <= altLet_38 when (true),
                 altLet_46 when others;
  
  altLet_28 <= altLet_39;
  
  ds4_29 <= systemConstants_25.product8_sel1;
  
  ds5_30 <= systemConstants_25.product8_sel2;
  
  ds6_31 <= systemConstants_25.product8_sel3;
  
  a9_32 <= signed(i_c_23);
  
  subjLet_33 <= i_ca_24 = std_logic_vector'("00000000");
  
  altLet_34 <= altLet_42;
  
  ds4_35 <= input_i2.product0_sel2;
  
  subjLet_36 <= i_ca_24 >= std_logic_vector'("00000100");
  
  ds3_37 <= systemConstants_25.product8_sel0;
  
  with (subjLet_26) select
    altLet_38 <= altLet_47 when (true),
                 altLet_46 when others;
  
  altLet_39 <= (product8_sel0 => ds3_37
               ,product8_sel1 => a9_32
               ,product8_sel2 => ds5_30
               ,product8_sel3 => ds6_31);
  
  subjLet_40 <= i_c_23 = std_logic_vector'("00000000000000000000000000000001");
  
  ds9_41 <= input_i2.product0_sel6;
  
  with (subjLet_49) select
    altLet_42 <= altLet_51 when (true),
                 altLet_50 when others;
  
  ds5_43 <= input_i2.product0_sel3;
  
  ds6_44 <= input_i2.product0_sel4;
  
  repANF_45 <= unsigned(i_c_23);
  
  with (subjLet_7) select
    altLet_46 <= altLet_53 when (true),
                 systemConstants_25 when others;
  
  altLet_47 <= altLet_54;
  
  subjLet_48 <= block_59 = std_logic_vector'("1");
  
  subjLet_49 <= ds9_41 = std_logic_vector'("1");
  
  with (subjLet_40) select
    altLet_50 <= altLet_57 when (true),
                 altLet_70 when others;
  
  altLet_51 <= (product10_sel0 => repANF_58
               ,product10_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product10_sel2 => std_logic_vector'("1"));
  
  systemState_52 <= ds1_i1.product5_sel0;
  
  with (subjLet_36) select
    altLet_53 <= altLet_60 when (true),
                 systemConstants_25 when others;
  
  altLet_54 <= (product8_sel0 => ds3_37
               ,product8_sel1 => ds4_29
               ,product8_sel2 => repANF_45
               ,product8_sel3 => ds6_31);
  
  subjLet_55 <= block_59 = std_logic_vector'("0");
  
  ds15_56 <= systemState_52.product7_sel1;
  
  with (subjLet_7) select
    altLet_57 <= altLet_64 when (true),
                 altLet_70 when others;
  
  repANF_58 <= altLet_65;
  
  block_59 <= ds1_i1.product5_sel3;
  
  altLet_60 <= altLet_66;
  
  altLet_61 <= (product10_sel0 => systemState_52
               ,product10_sel1 => oul_73
               ,product10_sel2 => block_59);
  
  ds14_62 <= systemState_52.product7_sel0;
  
  ds13_63 <= input_i2.product0_sel10;
  
  with (subjLet_33) select
    altLet_64 <= altLet_71 when (true),
                 altLet_70 when others;
  
  altLet_65 <= (product7_sel0 => repANF_72
               ,product7_sel1 => ds15_56);
  
  altLet_66 <= (product8_sel0 => ds3_37
               ,product8_sel1 => ds4_29
               ,product8_sel2 => ds5_30
               ,product8_sel3 => bodyVar_75);
  
  with (subjLet_100) select
    altLet_67 <= altLet_108 when (true),
                 altLet_61 when others;
  
  ds17_68 <= ds14_62.product3_sel1;
  
  subjLet_69 <= ds13_63 = std_logic_vector'("1");
  
  with (subjLet_48) select
    altLet_70 <= altLet_77 when (true),
                 bodyVar_83 when others;
  
  altLet_71 <= (product10_sel0 => repANF_78
               ,product10_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product10_sel2 => std_logic_vector'("0"));
  
  repANF_72 <= altLet_79;
  
  oul_73 <= ds1_i1.product5_sel2;
  
  repANF_74 <= to_integer(unsigned(i_ca_24));
  
  replaceVec_n_162 : block
    signal n_163 : array_of_signed_32(0 to 19);
    signal n_164 : integer;
    signal n_165 : signed(31 downto 0);
  begin
    n_163 <= ds6_31;
    n_164 <= repANF_80;
    n_165 <= a9_32;
    process(n_163,n_164,n_165)
      variable n_166 : array_of_signed_32(0 to 19);
    begin
      n_166 := n_163;
      -- pragma translate_off
      if n_164 < n_166'low or n_164 > n_166'high then
        assert false report ("Index: " & integer'image(n_164) & ", is out of bounds: " & integer'image(n_163'low) & " to " & integer'image(n_163'high)) severity warning;
        n_166 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_166(n_164) := n_165;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_161 <= n_166;
    end process;
  end block;
  
  bodyVar_75 <= tmp_161;
  
  ds16_76 <= ds14_62.product3_sel0;
  
  with (subjLet_69) select
    altLet_77 <= altLet_84 when (true),
                 bodyVar_83 when others;
  
  repANF_78 <= altLet_85;
  
  altLet_79 <= (product3_sel0 => bodyVar_86
               ,product3_sel1 => ds17_68);
  
  repANF_80 <= wild7_87;
  
  repANF_81 <= s_step_102 + unsigned'("00000000000000000000000000000001");
  
  ds10_82 <= input_i2.product0_sel7;
  
  with (subjLet_55) select
    bodyVar_83 <= altLet_88 when (true),
                  altLet_95 when others;
  
  altLet_84 <= (product10_sel0 => systemState_52
               ,product10_sel1 => repANF_89
               ,product10_sel2 => block_59);
  
  altLet_85 <= (product7_sel0 => ds14_62
               ,product7_sel1 => unsigned'("00000000000000000000000000000000"));
  
  replaceVec_n_171 : block
    signal n_172 : array_of_signed_32(0 to 4);
    signal n_173 : integer;
    signal n_174 : signed(31 downto 0);
  begin
    n_172 <= ds16_76;
    n_173 <= repANF_90;
    n_174 <= repANF_91;
    process(n_172,n_173,n_174)
      variable n_175 : array_of_signed_32(0 to 4);
    begin
      n_175 := n_172;
      -- pragma translate_off
      if n_173 < n_175'low or n_173 > n_175'high then
        assert false report ("Index: " & integer'image(n_173) & ", is out of bounds: " & integer'image(n_172'low) & " to " & integer'image(n_172'high)) severity warning;
        n_175 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_175(n_173) := n_174;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_170 <= n_175;
    end process;
  end block;
  
  bodyVar_86 <= tmp_170;
  
  wild7_87 <= repANF_74;
  
  with (subjLet_94) select
    altLet_88 <= altLet_96 when (true),
                 altLet_95 when others;
  
  repANF_89 <= altLet_97;
  
  repANF_90 <= wild7_98;
  
  repANF_91 <= signed(ds10_82);
  
  ds17_92 <= subjLet_116.product3_sel1;
  
  ds11_93 <= input_i2.product0_sel8;
  
  subjLet_94 <= s_step_102 < c_maxstep_103;
  
  with (subjLet_55) select
    altLet_95 <= altLet_67 when (true),
                 altLet_61 when others;
  
  altLet_96 <= (product10_sel0 => repANF_101
               ,product10_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product10_sel2 => block_59);
  
  altLet_97 <= bodyVar_104;
  
  wild7_98 <= repANF_105;
  
  ds16_99 <= subjLet_116.product3_sel0;
  
  subjLet_100 <= s_step_102 >= c_maxstep_103;
  
  repANF_101 <= altLet_109;
  
  s_step_102 <= ds15_56;
  
  c_maxstep_103 <= ds5_30;
  
  bodyVar_104 <= std_logic_vector(repANF_110);
  
  repANF_105 <= to_integer(unsigned(ds11_93));
  
  wild7_106 <= repANF_111;
  
  ds12_107 <= input_i2.product0_sel9;
  
  altLet_108 <= (product10_sel0 => repANF_112
                ,product10_sel1 => std_logic_vector(unsigned'("11111111111111111111111111111111"))
                ,product10_sel2 => std_logic_vector'("1"));
  
  altLet_109 <= (product7_sel0 => repANF_113
                ,product7_sel1 => repANF_81);
  
  indexVec_n_189 : block
    signal n_190 : array_of_signed_32(0 to 4);
    signal n_191 : integer;
  begin
    n_190 <= ds16_76;
    n_191 <= repANF_114;
    -- pragma translate_off
    process (n_190,n_191)
    begin
      if n_191 < n_190'low or n_191 > n_190'high then
        assert false report ("Index: " & integer'image(n_191) & ", is out of bounds: " & integer'image(n_190'low) & " to " & integer'image(n_190'high)) severity warning;
        tmp_188 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_188 <= n_190(n_191);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_110 <= tmp_188;
  
  repANF_111 <= to_integer(unsigned(ds12_107));
  
  repANF_112 <= altLet_115;
  
  repANF_113 <= altLet_117;
  
  repANF_114 <= wild7_106;
  
  altLet_115 <= (product7_sel0 => ds14_62
                ,product7_sel1 => unsigned'("11111111111111111111111111111111"));
  
  Solver_rk2_3_subjLet_116 : entity Solver_rk2_3
    port map
      (bodyVar_o => subjLet_116
      ,pTS_i1    => systemConstants_25
      ,eta_i2    => ds14_62);
  
  altLet_117 <= (product3_sel0 => repANF_118
                ,product3_sel1 => ds17_92);
  
  replaceVec_n_195 : block
    signal n_196 : array_of_signed_32(0 to 4);
    signal n_197 : integer;
    signal n_198 : signed(31 downto 0);
  begin
    n_196 <= ds16_99;
    n_197 <= 4;
    n_198 <= ds17_92;
    process(n_196,n_197,n_198)
      variable n_199 : array_of_signed_32(0 to 4);
    begin
      n_199 := n_196;
      -- pragma translate_off
      if n_197 < n_199'low or n_197 > n_199'high then
        assert false report ("Index: " & integer'image(n_197) & ", is out of bounds: " & integer'image(n_196'low) & " to " & integer'image(n_196'high)) severity warning;
        n_199 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_199(n_197) := n_198;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_194 <= n_199;
    end process;
  end block;
  
  repANF_118 <= tmp_194;
  
  topLet_o <= bodyVar_0;
end;
