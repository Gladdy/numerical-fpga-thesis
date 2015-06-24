-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity Solver_resizeFzm_13 is
  port(eta_i1    : in signed(63 downto 0);
       bodyVar_o : out signed(31 downto 0));
end;

architecture structural of Solver_resizeFzm_13 is
  signal shiftedR_0 : signed(63 downto 0);
  signal subjLet_1  : boolean;
  signal bodyVar_2  : signed(31 downto 0);
  signal subjLet_3  : boolean;
  signal bodyVar_4  : signed(31 downto 0);
  signal caseApp_5  : signed(63 downto 0);
  signal altLet_6   : signed(31 downto 0);
  signal subjLet_7  : boolean;
begin
  with (subjLet_1) select
    bodyVar_o <= bodyVar_2 when (true),
                 bodyVar_4 when others;
  
  Solver_zdfBitsSigned_zdcshiftR_14_shiftedR_0 : entity Solver_zdfBitsSigned_zdcshiftR_14
    port map
      (topLet_o => shiftedR_0
      ,pTS_i1   => eta_i1);
  
  Solver_zdfOrdSigned3_15_subjLet_1 : entity Solver_zdfOrdSigned3_15
    port map
      (topLet_o => subjLet_1
      ,pTS_i1   => eta_i1);
  
  with (subjLet_3) select
    bodyVar_2 <= altLet_6 when (true),
                 signed'(0 => '0', 1 to 32-1  => '1') when others;
  
  subjLet_3 <= caseApp_5 = signed'("0000000000000000000000000000000000000000000000000000000000000000");
  
  with (subjLet_7) select
    bodyVar_4 <= altLet_6 when (true),
                 signed'(0 => '1', 1 to 32-1 => '0') when others;
  
  Solver_Component_16_caseApp_5 : entity Solver_Component_16
    port map
      (topLet_o => caseApp_5
      ,pTS_i1   => shiftedR_0);
  
  altLet_6 <= resize(shiftedR_0,32);
  
  subjLet_7 <= caseApp_5 = (not (resize((signed'(0 => '0', 1 to 32-1  => '1')),64)));
end;
