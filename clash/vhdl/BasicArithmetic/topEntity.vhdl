-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity topEntity is
  port(input_0_0       : in signed(8 downto 0);
       input_0_1       : in signed(8 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       output_0        : out signed(8 downto 0));
end;

architecture structural of topEntity is
  signal input_0 : product0;
begin
  input_0 <= (product0_sel0 => input_0_0
             ,product0_sel1 => input_0_1);
  
  topEntity_0_inst : entity topEntity_0
    port map
      (eta_i1          => input_0
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,topLet_o        => output_0);
end;
