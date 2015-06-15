-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_forwardLEDS_2 is
  port(ds_i1    : in product2;
       input_i2 : in product0;
       topLet_o : out product3);
end;

architecture structural of Solver_forwardLEDS_2 is
  signal bodyVar_0          : product3;
  signal repANF_1           : product2;
  signal repANF_2           : product1;
  signal repANF_3           : product4;
  signal repANF_4           : product5;
  signal repANF_5           : std_logic_vector(3 downto 0);
  signal countzm_6          : std_logic_vector(31 downto 0);
  signal repANF_7           : array_of_std_logic_vector_32(0 to 4);
  signal subjLet_8          : boolean;
  signal altLet_9           : product5;
  signal altLet_10          : std_logic_vector(3 downto 0);
  signal ds1_11             : product6;
  signal subjLet_12         : boolean;
  signal altLet_13          : product5;
  signal altLet_14          : product5;
  signal ds2_15             : std_logic_vector(3 downto 0);
  signal countzm1_16        : std_logic_vector(31 downto 0);
  signal altLet_17          : product6;
  signal control_set_18     : std_logic_vector(0 downto 0);
  signal systemConstants_19 : product5;
  signal countzm1_20        : array_of_std_logic_vector_32(0 to 4);
  signal subjLet_21         : boolean;
  signal altLet_22          : product5;
  signal altLet_23          : product5;
  signal subjLet_24         : boolean;
  signal altLet_25          : product6;
  signal altLet_26          : product6;
  signal control_in_27      : std_logic_vector(31 downto 0);
  signal altLet_28          : product5;
  signal ds3_29             : std_logic_vector(31 downto 0);
  signal repANF_30          : array_of_std_logic_vector_32(0 to 4);
  signal repANF_31          : std_logic_vector(31 downto 0);
  signal repANF_32          : array_of_std_logic_vector_32(0 to 4);
  signal repANF_33          : std_logic_vector(31 downto 0);
  signal ds3_34             : std_logic_vector(0 downto 0);
  signal systemState_35     : product4;
  signal ds2_36             : std_logic_vector(31 downto 0);
  signal altLet_37          : product5;
  signal ds2_38             : array_of_std_logic_vector_32(0 to 4);
  signal ds4_39             : std_logic_vector(31 downto 0);
  signal repANF_40          : array_of_std_logic_vector_32(0 to 0);
  signal repANF_41          : array_of_std_logic_vector_32(0 to 3);
  signal altLet_42          : std_logic_vector(31 downto 0);
  signal ds4_43             : std_logic_vector(31 downto 0);
  signal repANF_44          : std_logic_vector(31 downto 0);
  signal ds11_45            : std_logic_vector(31 downto 0);
  signal altLet_46          : array_of_std_logic_vector_32(0 to 3);
  signal tmp_61             : array_of_std_logic_vector_32(0 to 3);
begin
  bodyVar_0 <= (product3_sel0 => repANF_1
               ,product3_sel1 => repANF_2);
  
  repANF_1 <= (product2_sel0 => repANF_3
              ,product2_sel1 => repANF_4);
  
  repANF_2 <= (product1_sel0 => repANF_5
              ,product1_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product1_sel2 => countzm_6);
  
  repANF_3 <= (product4_sel0 => repANF_7
              ,product4_sel1 => std_logic_vector'("00000000000000000000000000000000")
              ,product4_sel2 => countzm_6);
  
  with (subjLet_8) select
    repANF_4 <= altLet_9 when (true),
                altLet_13 when others;
  
  repANF_5 <= altLet_10;
  
  countzm_6 <= countzm1_16;
  
  repANF_7 <= countzm1_20;
  
  subjLet_8 <= control_set_18 = std_logic_vector'("1");
  
  with (subjLet_12) select
    altLet_9 <= altLet_14 when (true),
                altLet_13 when others;
  
  altLet_10 <= not ds2_15;
  
  with (subjLet_8) select
    ds1_11 <= altLet_17 when (true),
              altLet_25 when others;
  
  subjLet_12 <= control_in_27 = std_logic_vector'("00000000000000000000000000000010");
  
  with (subjLet_8) select
    altLet_13 <= altLet_22 when (true),
                 systemConstants_19 when others;
  
  altLet_14 <= altLet_23;
  
  ds2_15 <= input_i2.product0_sel0;
  
  countzm1_16 <= ds1_11.product6_sel1;
  
  with (subjLet_24) select
    altLet_17 <= altLet_26 when (true),
                 altLet_25 when others;
  
  control_set_18 <= ds3_34;
  
  systemConstants_19 <= ds_i1.product2_sel1;
  
  countzm1_20 <= ds1_11.product6_sel0;
  
  subjLet_21 <= control_in_27 = std_logic_vector'("00000000000000000000000000000011");
  
  with (subjLet_21) select
    altLet_22 <= altLet_28 when (true),
                 systemConstants_19 when others;
  
  altLet_23 <= (product5_sel0 => repANF_44
               ,product5_sel1 => ds3_29);
  
  subjLet_24 <= control_in_27 = std_logic_vector'("00000000000000000000000000000001");
  
  altLet_25 <= (product6_sel0 => repANF_30
               ,product6_sel1 => repANF_31);
  
  altLet_26 <= (product6_sel0 => repANF_32
               ,product6_sel1 => repANF_33);
  
  control_in_27 <= ds4_43;
  
  altLet_28 <= altLet_37;
  
  ds3_29 <= systemConstants_19.product5_sel1;
  
  repANF_30 <= ds2_38;
  
  repANF_31 <= ds4_39;
  
  repANF_32 <= array_of_std_logic_vector_32'(repANF_40) & array_of_std_logic_vector_32'(repANF_41);
  
  repANF_33 <= altLet_42;
  
  ds3_34 <= input_i2.product0_sel2;
  
  systemState_35 <= ds_i1.product2_sel0;
  
  ds2_36 <= systemConstants_19.product5_sel0;
  
  altLet_37 <= (product5_sel0 => ds2_36
               ,product5_sel1 => repANF_44);
  
  ds2_38 <= systemState_35.product4_sel0;
  
  ds4_39 <= systemState_35.product4_sel2;
  
  repANF_40 <= array_of_std_logic_vector_32'(0 => control_in_27);
  
  repANF_41 <= altLet_46;
  
  altLet_42 <= std_logic_vector(unsigned(ds4_39) + unsigned(std_logic_vector'("00000000000000000000000000000001")));
  
  ds4_43 <= input_i2.product0_sel3;
  
  repANF_44 <= ds11_45;
  
  ds11_45 <= input_i2.product0_sel7;
  
  init_n_62 : block
    signal n_63 : array_of_std_logic_vector_32(0 to 4);
  begin
    n_63 <= ds2_38;
    tmp_61 <= n_63(0 to n_63'high - 1);
  end block;
  
  altLet_46 <= tmp_61;
  
  topLet_o <= bodyVar_0;
end;
