-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity mealyzm_1 is
  port(eta_i1          : in product0;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out std_logic_vector(3 downto 0));
end;

architecture structural of mealyzm_1 is
  signal y_0       : std_logic_vector(3 downto 0);
  signal bodyVar_1 : product0;
  signal x_2       : std_logic_vector(3 downto 0);
  signal repANF_3  : std_logic_vector(3 downto 0);
  signal x_4       : std_logic_vector(3 downto 0);
  signal tmp_5     : std_logic_vector(3 downto 0);
begin
  bodyVar_o <= y_0;
  
  y_0 <= bodyVar_1.product0_sel1;
  
  forward_2_bodyVar_1 : entity forward_2
    port map
      (topLet_o => bodyVar_1
      ,eta_i1   => x_2
      ,eta_i2   => eta_i1);
  
  register_mealyzm_1_n_7 : block
    signal n_8 : std_logic_vector(3 downto 0);
    signal n_9 : std_logic_vector(3 downto 0);
  begin
    n_8 <= std_logic_vector'("0000");
  
    process(system1000,system1000_rstn,n_8)
    begin
      if system1000_rstn = '0' then
        n_9 <= n_8;
      elsif rising_edge(system1000) then
        n_9 <= repANF_3;
      end if;
    end process;
  
    tmp_5 <= n_9;
  end block;
  
  x_2 <= tmp_5;
  
  repANF_3 <= x_4;
  
  x_4 <= bodyVar_1.product0_sel0;
end;
