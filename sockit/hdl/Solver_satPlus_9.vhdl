-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_satPlus_9 is
  port(eta_i1    : in signed(31 downto 0);
       eta_i2    : in signed(31 downto 0);
       bodyVar_o : out signed(31 downto 0));
end;

architecture structural of Solver_satPlus_9 is
  signal a1_0       : signed(32 downto 0);
  signal repANF_1   : std_logic_vector(31 downto 0);
  signal repANF_2   : std_logic_vector(31 downto 0);
  signal rzm1_3     : std_logic_vector(31 downto 0);
  signal repANF_4   : std_logic_vector(0 downto 0);
  signal repANF_5   : std_logic_vector(0 downto 0);
  signal repANF_6   : std_logic_vector(32 downto 0);
  signal subjLet_7  : product11;
  signal repANF_8   : std_logic_vector(0 downto 0);
  signal repANF_9   : std_logic_vector(0 downto 0);
  signal repANF_10  : std_logic_vector(0 downto 0);
  signal rzm_11     : std_logic_vector(31 downto 0);
  signal subjLet_12 : boolean;
  signal repANF_13  : std_logic_vector(0 downto 0);
  signal altLet_14  : signed(31 downto 0);
  signal altLet_15  : signed(31 downto 0);
  signal subjLet_16 : boolean;
  signal tmp_20     : std_logic_vector(0 downto 0);
  signal tmp_25     : std_logic_vector(0 downto 0);
  signal tmp_31     : product11;
  signal tmp_35     : std_logic_vector(0 downto 0);
  signal tmp_40     : std_logic_vector(0 downto 0);
begin
  a1_0 <= resize(eta_i1,33) + resize(eta_i2,33);
  
  repANF_1 <= std_logic_vector(eta_i2);
  
  repANF_2 <= std_logic_vector(eta_i1);
  
  rzm1_3 <= subjLet_7.product11_sel1;
  
  msb_n_21 : block
    signal n_22 : std_logic_vector(31 downto 0);
  begin
    n_23_generate : if n_22'length = 0 generate
    begin
      tmp_20 <= "0";
    end generate;
  
    n_24_generate : if n_22'length /= 0 generate
      n_22 <= repANF_1;
      tmp_20 <= n_22(n_22'high downto n_22'high);
    end generate;
  end block;
  
  repANF_4 <= tmp_20;
  
  msb_n_26 : block
    signal n_27 : std_logic_vector(31 downto 0);
  begin
    n_28_generate : if n_27'length = 0 generate
    begin
      tmp_25 <= "0";
    end generate;
  
    n_29_generate : if n_27'length /= 0 generate
      n_27 <= repANF_2;
      tmp_25 <= n_27(n_27'high downto n_27'high);
    end generate;
  end block;
  
  repANF_5 <= tmp_25;
  
  repANF_6 <= std_logic_vector(a1_0);
  
  split_n_32: block
    signal n_33 : std_logic_vector(32 downto 0);
  begin
    n_33 <= repANF_6;
    tmp_31 <= ( n_33(tmp_31.product11_sel0'left + tmp_31.product11_sel1'length downto
                 tmp_31.product11_sel0'right + tmp_31.product11_sel1'length)
               , n_33(tmp_31.product11_sel1'left downto tmp_31.product11_sel1'right)
               );
  end block;
  
  subjLet_7 <= tmp_31;
  
  repANF_8 <= repANF_5 and repANF_4;
  
  msb_n_36 : block
    signal n_37 : std_logic_vector(31 downto 0);
  begin
    n_38_generate : if n_37'length = 0 generate
    begin
      tmp_35 <= "0";
    end generate;
  
    n_39_generate : if n_37'length /= 0 generate
      n_37 <= rzm_11;
      tmp_35 <= n_37(n_37'high downto n_37'high);
    end generate;
  end block;
  
  repANF_9 <= tmp_35;
  
  msb_n_41 : block
    signal n_42 : std_logic_vector(32 downto 0);
  begin
    n_43_generate : if n_42'length = 0 generate
    begin
      tmp_40 <= "0";
    end generate;
  
    n_44_generate : if n_42'length /= 0 generate
      n_42 <= repANF_6;
      tmp_40 <= n_42(n_42'high downto n_42'high);
    end generate;
  end block;
  
  repANF_10 <= tmp_40;
  
  rzm_11 <= rzm1_3;
  
  subjLet_12 <= repANF_8 = std_logic_vector'("1");
  
  repANF_13 <= repANF_10 xor repANF_9;
  
  altLet_14 <= signed(rzm_11);
  
  with (subjLet_12) select
    altLet_15 <= signed'(0 => '1', 1 to 32-1 => '0') when (true),
                 signed'(0 => '0', 1 to 32-1  => '1') when others;
  
  subjLet_16 <= repANF_13 = std_logic_vector'("0");
  
  with (subjLet_16) select
    bodyVar_o <= altLet_14 when (true),
                 altLet_15 when others;
end;
