-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity zuzpzf_3 is
  port(ds_i1          : in product0;
       eta_i2         : in product0;
       system1000     : in std_logic;
       system1000_rst : in std_logic;
       topLet_o       : out product0);
end;

architecture structural of zuzpzf_3 is
  signal repANF_0 : signed(8 downto 0);
  signal szm_1    : signed(8 downto 0);
  signal tmp_2    : signed(8 downto 0);
begin
  register_n_4 : block
    signal n_5 : signed(8 downto 0);
    signal n_6 : signed(8 downto 0);
  begin
    n_5 <= signed'("000000000");
  
    process(system1000,system1000_rst,n_5)
    begin
      if system1000_rst = '0' then
        n_6 <= n_5;
      elsif rising_edge(system1000) then
        n_6 <= szm_1;
      end if;
    end process;
  
    tmp_2 <= n_6;
  end block;
  
  repANF_0 <= tmp_2;
  
  szm_1 <= ds_i1.product0_sel0;
  
  macT_4_topLet_o : entity macT_4
    port map
      (topLet_o => topLet_o
      ,acc_i1   => repANF_0
      ,ds_i2    => eta_i2);
end;
