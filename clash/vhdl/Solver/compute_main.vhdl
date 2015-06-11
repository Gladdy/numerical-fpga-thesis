-- Automatically generated VHDL
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.types.all;

entity compute_main is
  port(keys_input     : in std_logic_vector(3 downto 0);
       switches_input : in std_logic_vector(3 downto 0);
       leds_status    : out std_logic_vector(3 downto 0));
end;

architecture structural of compute_main is
  signal system1000      : std_logic;
  signal system1000_rstn : std_logic;
  signal altpll50_locked : std_logic;
  signal input_0         : product0;
begin
  altpll50_inst : entity altpll50
    port map
      (inclk0 => CLOCK_50(0)
      ,c0     => system1000
      ,areset => not KEY0(0)
      ,locked => altpll50_locked);
  
  -- reset system1000_rstn is asynchronously asserted, but synchronously de-asserted
  resetSync_n_0 : block
    signal n_1 : std_logic;
    signal n_2 : std_logic;
  begin
    process(system1000,altpll50_locked)
    begin
      if altpll50_locked = '0' then
        n_1 <= '0';
        n_2 <= '0';
      elsif rising_edge(system1000) then
        n_1 <= '1';
        n_2 <= n_1;
      end if;
    end process;
  
    system1000_rstn <= n_2;
  end block;
  
  input_0 <= (product0_sel0 => keys_input
             ,product0_sel1 => switches_input);
  
  topEntity_0_inst : entity topEntity_0
    port map
      (w3_i1           => input_0
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,topLet_o        => leds_status);
end;
