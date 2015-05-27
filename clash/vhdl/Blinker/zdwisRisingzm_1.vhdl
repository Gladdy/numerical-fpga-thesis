-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity zdwisRisingzm_1 is
  port(eta_i1          : in std_logic_vector(0 downto 0);
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       bodyVar_o       : out boolean);
end;

architecture structural of zdwisRisingzm_1 is
  signal x_0   : std_logic_vector(0 downto 0);
  signal tmp_1 : std_logic_vector(0 downto 0);
begin
  register_zdwisRisingzm_1_n_3 : block
    signal n_4 : std_logic_vector(0 downto 0);
    signal n_5 : std_logic_vector(0 downto 0);
  begin
    n_4 <= std_logic_vector'("1");
  
    process(system1000,system1000_rstn,n_4)
    begin
      if system1000_rstn = '0' then
        n_5 <= n_4;
      elsif rising_edge(system1000) then
        n_5 <= eta_i1;
      end if;
    end process;
  
    tmp_1 <= n_5;
  end block;
  
  x_0 <= tmp_1;
  
  zdwisRisingzm2_2_bodyVar_o : entity zdwisRisingzm2_2
    port map
      (topLet_o => bodyVar_o
      ,old_i1   => x_0
      ,new_i2   => eta_i1);
end;
