-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_forwardLEDS_2 is
  port(ds2_i1    : in product6;
       input_i2  : in product0;
       bodyVar_o : out product8);
end;

architecture structural of Solver_forwardLEDS_2 is
  signal repANF_0           : product6;
  signal repANF_1           : product1;
  signal repANF_2           : product2;
  signal subjLet_3          : boolean;
  signal altLet_4           : product2;
  signal altLet_5           : std_logic_vector(3 downto 0);
  signal ds3_6              : product9;
  signal oulzm1_7           : product7;
  signal subjLet_8          : boolean;
  signal altLet_9           : product2;
  signal oulzm1_10          : std_logic_vector(0 downto 0);
  signal ds4_11             : std_logic_vector(3 downto 0);
  signal oulzm1_12          : std_logic_vector(31 downto 0);
  signal subjLet_13         : boolean;
  signal altLet_14          : product9;
  signal subjLet_15         : boolean;
  signal bodyVar_16         : product2;
  signal subjLet_17         : boolean;
  signal altLet_18          : product9;
  signal subjLet_19         : boolean;
  signal altLet_20          : product2;
  signal ds6_21             : std_logic_vector(31 downto 0);
  signal systemConstants_22 : product2;
  signal subjLet_23         : boolean;
  signal ds5_24             : signed(31 downto 0);
  signal ds6_25             : unsigned(31 downto 0);
  signal ds7_26             : array_of_signed_32(0 to 15);
  signal a9_27              : signed(31 downto 0);
  signal altLet_28          : product2;
  signal subjLet_29         : boolean;
  signal ds10_30            : std_logic_vector(0 downto 0);
  signal bodyVar_31         : product9;
  signal ds5_32             : std_logic_vector(0 downto 0);
  signal block_33           : std_logic_vector(0 downto 0);
  signal subjLet_34         : boolean;
  signal ds4_35             : signed(31 downto 0);
  signal altLet_36          : product2;
  signal altLet_37          : product2;
  signal subjLet_38         : boolean;
  signal bodyVar_39         : product9;
  signal subjLet_40         : boolean;
  signal altLet_41          : product9;
  signal ds7_42             : std_logic_vector(7 downto 0);
  signal systemState_43     : product7;
  signal repANF_44          : unsigned(31 downto 0);
  signal altLet_45          : product2;
  signal subjLet_46         : boolean;
  signal ds17_47            : unsigned(31 downto 0);
  signal altLet_48          : product9;
  signal repANF_49          : std_logic_vector(31 downto 0);
  signal altLet_50          : product2;
  signal altLet_51          : product2;
  signal altLet_52          : product9;
  signal ds16_53            : unsigned(31 downto 0);
  signal ds14_54            : std_logic_vector(0 downto 0);
  signal altLet_55          : product9;
  signal altLet_56          : product7;
  signal altLet_57          : product2;
  signal ds19_58            : signed(31 downto 0);
  signal subjLet_59         : boolean;
  signal altLet_60          : product9;
  signal altLet_61          : product9;
  signal altLet_62          : unsigned(31 downto 0);
  signal oul_63             : std_logic_vector(31 downto 0);
  signal altLet_64          : product2;
  signal altLet_65          : product2;
  signal s_odestate_upzm_66 : product3;
  signal ds15_67            : product3;
  signal ds18_68            : array_of_signed_32(0 to 15);
  signal altLet_69          : product9;
  signal altLet_70          : product3;
  signal repANF_71          : integer;
  signal repANF_72          : unsigned(31 downto 0);
  signal ds16_73            : signed(31 downto 0);
  signal altLet_74          : product9;
  signal ds11_75            : std_logic_vector(31 downto 0);
  signal altLet_76          : product9;
  signal bodyVar_77         : product9;
  signal altLet_78          : product9;
  signal altLet_79          : product7;
  signal bodyVar_80         : array_of_signed_32(0 to 15);
  signal altLet_81          : product2;
  signal altLet_82          : product9;
  signal repANF_83          : integer;
  signal repANF_84          : signed(31 downto 0);
  signal bodyVar_85         : array_of_signed_32(0 to 15);
  signal altLet_86          : std_logic_vector(31 downto 0);
  signal ds12_87            : std_logic_vector(7 downto 0);
  signal bodyVar_88         : product9;
  signal subjLet_89         : boolean;
  signal bodyVar_90         : std_logic_vector(31 downto 0);
  signal wild6_91           : integer;
  signal repANF_92          : integer;
  signal wild6_93           : integer;
  signal ds13_94            : std_logic_vector(7 downto 0);
  signal subjLet_95         : boolean;
  signal repANF_96          : signed(31 downto 0);
  signal repANF_97          : integer;
  signal wild6_98           : integer;
  signal altLet_99          : std_logic_vector(31 downto 0);
  signal repANF_100         : integer;
  signal altLet_101         : product9;
  signal altLet_102         : product7;
  signal repANF_103         : integer;
  signal altLet_104         : product7;
  signal tmp_162            : array_of_signed_32(0 to 15);
  signal tmp_169            : array_of_signed_32(0 to 15);
  signal tmp_181            : signed(31 downto 0);
begin
  bodyVar_o <= (product8_sel0 => repANF_0
               ,product8_sel1 => repANF_1);
  
  repANF_0 <= (product6_sel0 => oulzm1_7
              ,product6_sel1 => repANF_2
              ,product6_sel2 => oulzm1_12
              ,product6_sel3 => oulzm1_10);
  
  repANF_1 <= (product1_sel0 => altLet_5
              ,product1_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product1_sel2 => oulzm1_12);
  
  with (subjLet_3) select
    repANF_2 <= altLet_4 when (true),
                bodyVar_16 when others;
  
  subjLet_3 <= ds6_21 = std_logic_vector'("00000000000000000000000000000011");
  
  with (subjLet_8) select
    altLet_4 <= altLet_9 when (true),
                bodyVar_16 when others;
  
  altLet_5 <= not ds4_11;
  
  with (subjLet_13) select
    ds3_6 <= altLet_14 when (true),
             bodyVar_31 when others;
  
  oulzm1_7 <= ds3_6.product9_sel0;
  
  subjLet_8 <= ds5_32 = std_logic_vector'("1");
  
  with (subjLet_17) select
    altLet_9 <= (product2_sel0 => shift_left(signed'("00000000000000000000000001111101"),24)
                ,product2_sel1 => signed'("00000000000000101000111101011100")
                ,product2_sel2 => unsigned'("00000000000000000000000000000101")
                ,product2_sel3 => array_of_signed_32'(0 to (16)-1 => (shift_left(signed'("00000000000000000000000000000000"),24)))) when (true),
                bodyVar_16 when others;
  
  oulzm1_10 <= ds3_6.product9_sel2;
  
  ds4_11 <= input_i2.product0_sel0;
  
  oulzm1_12 <= ds3_6.product9_sel1;
  
  subjLet_13 <= ds6_21 = std_logic_vector'("00000000000000000000000000000010");
  
  with (subjLet_8) select
    altLet_14 <= altLet_18 when (true),
                 bodyVar_31 when others;
  
  subjLet_15 <= ds7_42 = std_logic_vector'("00000001");
  
  with (subjLet_8) select
    bodyVar_16 <= altLet_20 when (true),
                  altLet_28 when others;
  
  subjLet_17 <= ds7_42 = std_logic_vector'("00000000");
  
  with (subjLet_17) select
    altLet_18 <= (product9_sel0 => (product7_sel0 => (product3_sel0 => array_of_signed_32'(0 to (16)-1 => (shift_left(signed'("00000000000000000000000000000000"),24)))
                                                     ,product3_sel1 => shift_left(signed'("00000000000000000000000000000000"),24))
                                   ,product7_sel1 => unsigned'("00000000000000000000000000000000")
                                   ,product7_sel2 => unsigned'("11111111111111111111111111111111"))
                 ,product9_sel1 => std_logic_vector'("00000000000000000000000000000000")
                 ,product9_sel2 => std_logic_vector'("0")) when (true),
                 bodyVar_31 when others;
  
  subjLet_19 <= ds7_42 = std_logic_vector'("00000010");
  
  with (subjLet_15) select
    altLet_20 <= altLet_37 when (true),
                 altLet_28 when others;
  
  ds6_21 <= input_i2.product0_sel3;
  
  systemConstants_22 <= ds2_i1.product6_sel1;
  
  subjLet_23 <= ds7_42 = std_logic_vector'("00000011");
  
  ds5_24 <= systemConstants_22.product2_sel1;
  
  ds6_25 <= systemConstants_22.product2_sel2;
  
  ds7_26 <= systemConstants_22.product2_sel3;
  
  a9_27 <= signed(ds6_21);
  
  with (subjLet_8) select
    altLet_28 <= altLet_36 when (true),
                 altLet_45 when others;
  
  subjLet_29 <= ds6_21 = std_logic_vector'("00000000000000000000000000000001");
  
  ds10_30 <= input_i2.product0_sel6;
  
  with (subjLet_40) select
    bodyVar_31 <= bodyVar_39 when (true),
                  altLet_41 when others;
  
  ds5_32 <= input_i2.product0_sel2;
  
  block_33 <= ds2_i1.product6_sel3;
  
  subjLet_34 <= ds7_42 >= std_logic_vector'("00000100");
  
  ds4_35 <= systemConstants_22.product2_sel0;
  
  with (subjLet_19) select
    altLet_36 <= altLet_51 when (true),
                 altLet_45 when others;
  
  altLet_37 <= (product2_sel0 => a9_27
               ,product2_sel1 => ds5_24
               ,product2_sel2 => ds6_25
               ,product2_sel3 => ds7_26);
  
  subjLet_38 <= block_33 = std_logic_vector'("1");
  
  bodyVar_39 <= (product9_sel0 => altLet_56
                ,product9_sel1 => repANF_49
                ,product9_sel2 => block_33);
  
  subjLet_40 <= ds10_30 = std_logic_vector'("1");
  
  with (subjLet_29) select
    altLet_41 <= altLet_48 when (true),
                 altLet_60 when others;
  
  ds7_42 <= input_i2.product0_sel4;
  
  systemState_43 <= ds2_i1.product6_sel0;
  
  repANF_44 <= unsigned(ds6_21);
  
  with (subjLet_8) select
    altLet_45 <= altLet_50 when (true),
                 altLet_57 when others;
  
  subjLet_46 <= block_33 = std_logic_vector'("0");
  
  ds17_47 <= systemState_43.product7_sel2;
  
  with (subjLet_8) select
    altLet_48 <= altLet_55 when (true),
                 altLet_60 when others;
  
  repANF_49 <= std_logic_vector(altLet_62);
  
  with (subjLet_23) select
    altLet_50 <= altLet_65 when (true),
                 altLet_57 when others;
  
  altLet_51 <= (product2_sel0 => ds4_35
               ,product2_sel1 => a9_27
               ,product2_sel2 => ds6_25
               ,product2_sel3 => ds7_26);
  
  altLet_52 <= (product9_sel0 => systemState_43
               ,product9_sel1 => oul_63
               ,product9_sel2 => block_33);
  
  ds16_53 <= systemState_43.product7_sel1;
  
  ds14_54 <= input_i2.product0_sel10;
  
  with (subjLet_17) select
    altLet_55 <= altLet_61 when (true),
                 altLet_60 when others;
  
  altLet_56 <= (product7_sel0 => altLet_70
               ,product7_sel1 => altLet_62
               ,product7_sel2 => ds17_47);
  
  with (subjLet_8) select
    altLet_57 <= altLet_64 when (true),
                 systemConstants_22 when others;
  
  ds19_58 <= ds15_67.product3_sel1;
  
  subjLet_59 <= ds14_54 = std_logic_vector'("1");
  
  with (subjLet_38) select
    altLet_60 <= altLet_69 when (true),
                 bodyVar_77 when others;
  
  altLet_61 <= (product9_sel0 => altLet_79
               ,product9_sel1 => std_logic_vector'("00000000000000000000000000000000")
               ,product9_sel2 => std_logic_vector'("0"));
  
  altLet_62 <= ds16_53 + unsigned'("00000000000000000000000000000001");
  
  oul_63 <= ds2_i1.product6_sel2;
  
  with (subjLet_34) select
    altLet_64 <= altLet_81 when (true),
                 systemConstants_22 when others;
  
  altLet_65 <= (product2_sel0 => ds4_35
               ,product2_sel1 => ds5_24
               ,product2_sel2 => repANF_44
               ,product2_sel3 => ds7_26);
  
  Solver_eulerScheme_3_s_odestate_upzm_66 : entity Solver_eulerScheme_3
    port map
      (bodyVar_o => s_odestate_upzm_66
      ,pTS_i1    => systemConstants_22
      ,eta_i2    => ds15_67);
  
  ds15_67 <= systemState_43.product7_sel0;
  
  ds18_68 <= ds15_67.product3_sel0;
  
  with (subjLet_59) select
    altLet_69 <= altLet_78 when (true),
                 bodyVar_77 when others;
  
  altLet_70 <= (product3_sel0 => bodyVar_80
               ,product3_sel1 => ds19_58);
  
  repANF_71 <= to_integer(unsigned(ds7_42));
  
  repANF_72 <= ds17_47 + unsigned'("00000000000000000000000000000001");
  
  ds16_73 <= s_odestate_upzm_66.product3_sel1;
  
  with (subjLet_46) select
    altLet_74 <= altLet_76 when (true),
                 altLet_52 when others;
  
  ds11_75 <= input_i2.product0_sel7;
  
  with (subjLet_95) select
    altLet_76 <= altLet_101 when (true),
                 altLet_52 when others;
  
  with (subjLet_46) select
    bodyVar_77 <= altLet_82 when (true),
                  altLet_74 when others;
  
  altLet_78 <= (product9_sel0 => systemState_43
               ,product9_sel1 => bodyVar_90
               ,product9_sel2 => block_33);
  
  altLet_79 <= (product7_sel0 => ds15_67
               ,product7_sel1 => ds16_53
               ,product7_sel2 => unsigned'("00000000000000000000000000000000"));
  
  replaceVec_n_163 : block
    signal n_164 : array_of_signed_32(0 to 15);
    signal n_165 : integer;
    signal n_166 : signed(31 downto 0);
  begin
    n_164 <= ds18_68;
    n_165 <= repANF_83;
    n_166 <= repANF_84;
    process(n_164,n_165,n_166)
      variable n_167 : array_of_signed_32(0 to 15);
    begin
      n_167 := n_164;
      -- pragma translate_off
      if n_165 < n_167'low or n_165 > n_167'high then
        assert false report ("Index: " & integer'image(n_165) & ", is out of bounds: " & integer'image(n_164'low) & " to " & integer'image(n_164'high)) severity warning;
        n_167 := (others => (others => 'X'));
      else
        -- pragma translate_on
        n_167(n_165) := n_166;
        -- pragma translate_off
      end if;
      -- pragma translate_on
      tmp_162 <= n_167;
    end process;
  end block;
  
  bodyVar_80 <= tmp_162;
  
  altLet_81 <= (product2_sel0 => ds4_35
               ,product2_sel1 => ds5_24
               ,product2_sel2 => ds6_25
               ,product2_sel3 => bodyVar_85);
  
  with (subjLet_89) select
    altLet_82 <= bodyVar_88 when (true),
                 altLet_74 when others;
  
  repANF_83 <= wild6_91;
  
  repANF_84 <= signed(ds11_75);
  
  replaceVec_n_170 : block
    signal n_171 : array_of_signed_32(0 to 15);
    signal n_172 : integer;
    signal n_173 : signed(31 downto 0);
  begin
    n_171 <= ds7_26;
    n_172 <= repANF_92;
    n_173 <= a9_27;
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
  
  bodyVar_85 <= tmp_169;
  
  altLet_86 <= std_logic_vector(ds16_73);
  
  ds12_87 <= input_i2.product0_sel8;
  
  bodyVar_88 <= (product9_sel0 => altLet_102
                ,product9_sel1 => altLet_86
                ,product9_sel2 => block_33);
  
  subjLet_89 <= ds17_47 < ds6_25;
  
  bodyVar_90 <= std_logic_vector(repANF_96);
  
  wild6_91 <= repANF_97;
  
  repANF_92 <= wild6_98;
  
  wild6_93 <= repANF_100;
  
  ds13_94 <= input_i2.product0_sel9;
  
  subjLet_95 <= ds17_47 >= ds6_25;
  
  indexVec_n_182 : block
    signal n_183 : array_of_signed_32(0 to 15);
    signal n_184 : integer;
  begin
    n_183 <= ds18_68;
    n_184 <= repANF_103;
    -- pragma translate_off
    process (n_183,n_184)
    begin
      if n_184 < n_183'low or n_184 > n_183'high then
        assert false report ("Index: " & integer'image(n_184) & ", is out of bounds: " & integer'image(n_183'low) & " to " & integer'image(n_183'high)) severity warning;
        tmp_181 <= (others => 'X');
      else
      -- pragma translate_on
        tmp_181 <= n_183(n_184);
      -- pragma translate_off
      end if;
    end process;
    -- pragma translate_on
  end block;
  
  repANF_96 <= tmp_181;
  
  repANF_97 <= to_integer(unsigned(ds12_87));
  
  wild6_98 <= repANF_71;
  
  altLet_99 <= std_logic_vector(ds19_58);
  
  repANF_100 <= to_integer(unsigned(ds13_94));
  
  altLet_101 <= (product9_sel0 => altLet_104
                ,product9_sel1 => altLet_99
                ,product9_sel2 => std_logic_vector'("1"));
  
  altLet_102 <= (product7_sel0 => s_odestate_upzm_66
                ,product7_sel1 => ds16_53
                ,product7_sel2 => repANF_72);
  
  repANF_103 <= wild6_93;
  
  altLet_104 <= (product7_sel0 => ds15_67
                ,product7_sel1 => ds16_53
                ,product7_sel2 => unsigned'("11111111111111111111111111111111"));
end;
