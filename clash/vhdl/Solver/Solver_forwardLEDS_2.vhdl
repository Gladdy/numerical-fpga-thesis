-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_forwardLEDS_2 is
  port(eta_i1   : in product2;
       eta_i2   : in product0;
       topLet_o : out product3);
end;

architecture structural of Solver_forwardLEDS_2 is
  signal bodyVar_0      : product3;
  signal repANF_1       : product2;
  signal repANF_2       : product1;
  signal repANF_3       : product4;
  signal repANF_4       : std_logic_vector(3 downto 0);
  signal countzm_5      : std_logic_vector(31 downto 0);
  signal outputLatch_6  : integer;
  signal repANF_7       : array_of_std_logic_vector_32(0 to 4);
  signal altLet_8       : std_logic_vector(3 downto 0);
  signal ds1_9          : product5;
  signal ds2_10         : std_logic_vector(3 downto 0);
  signal countzm1_11    : std_logic_vector(31 downto 0);
  signal altLet_12      : product5;
  signal countzm1_13    : array_of_std_logic_vector_32(0 to 4);
  signal subjLet_14     : boolean;
  signal altLet_15      : product5;
  signal subjLet_16     : boolean;
  signal altLet_17      : product5;
  signal altLet_18      : product5;
  signal ds4_19         : std_logic_vector(0 downto 0);
  signal repANF_20      : array_of_std_logic_vector_32(0 to 4);
  signal repANF_21      : std_logic_vector(31 downto 0);
  signal repANF_22      : array_of_std_logic_vector_32(0 to 4);
  signal repANF_23      : std_logic_vector(31 downto 0);
  signal ds5_24         : std_logic_vector(31 downto 0);
  signal systemState_25 : product4;
  signal ds12_26        : array_of_std_logic_vector_32(0 to 4);
  signal ds14_27        : std_logic_vector(31 downto 0);
  signal repANF_28      : array_of_std_logic_vector_32(0 to 0);
  signal repANF_29      : array_of_std_logic_vector_32(0 to 3);
  signal altLet_30      : std_logic_vector(31 downto 0);
  signal altLet_31      : array_of_std_logic_vector_32(0 to 3);
  signal tmp_43         : array_of_std_logic_vector_32(0 to 3);
begin
  bodyVar_0 <= (product3_sel0 => repANF_1
               ,product3_sel1 => repANF_2);
  
  repANF_1 <= (product2_sel0 => repANF_3
              ,product2_sel1 => outputLatch_6);
  
  repANF_2 <= (product1_sel0 => repANF_4
              ,product1_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product1_sel2 => countzm_5);
  
  repANF_3 <= (product4_sel0 => repANF_7
              ,product4_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product4_sel2 => countzm_5
              ,product4_sel3 => std_logic_vector'("1"));
  
  repANF_4 <= altLet_8;
  
  countzm_5 <= countzm1_11;
  
  outputLatch_6 <= eta_i1.product2_sel1;
  
  repANF_7 <= countzm1_13;
  
  altLet_8 <= not ds2_10;
  
  ds1_9 <= altLet_12;
  
  ds2_10 <= eta_i2.product0_sel0;
  
  countzm1_11 <= ds1_9.product5_sel1;
  
  with (subjLet_14) select
    altLet_12 <= altLet_15 when (true),
                 altLet_17 when others;
  
  countzm1_13 <= ds1_9.product5_sel0;
  
  subjLet_14 <= ds4_19 = std_logic_vector'("1");
  
  with (subjLet_16) select
    altLet_15 <= altLet_18 when (true),
                 altLet_17 when others;
  
  subjLet_16 <= ds5_24 = std_logic_vector'("00000000000000000000000000000001");
  
  altLet_17 <= (product5_sel0 => repANF_20
               ,product5_sel1 => repANF_21);
  
  altLet_18 <= (product5_sel0 => repANF_22
               ,product5_sel1 => repANF_23);
  
  ds4_19 <= eta_i2.product0_sel2;
  
  repANF_20 <= ds12_26;
  
  repANF_21 <= ds14_27;
  
  repANF_22 <= array_of_std_logic_vector_32'(repANF_28) & array_of_std_logic_vector_32'(repANF_29);
  
  repANF_23 <= altLet_30;
  
  ds5_24 <= eta_i2.product0_sel3;
  
  systemState_25 <= eta_i1.product2_sel0;
  
  ds12_26 <= systemState_25.product4_sel0;
  
  ds14_27 <= systemState_25.product4_sel2;
  
  repANF_28 <= array_of_std_logic_vector_32'(0 => ds5_24);
  
  repANF_29 <= altLet_31;
  
  altLet_30 <= std_logic_vector(unsigned(ds14_27) + unsigned(std_logic_vector'("00000000000000000000000000000001")));
  
  init_n_44 : block
    signal n_45 : array_of_std_logic_vector_32(0 to 4);
  begin
    n_45 <= ds12_26;
    tmp_43 <= n_45(0 to n_45'high - 1);
  end block;
  
  altLet_31 <= tmp_43;
  
  topLet_o <= bodyVar_0;
end;
