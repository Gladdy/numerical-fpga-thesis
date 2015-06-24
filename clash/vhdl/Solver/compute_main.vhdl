-- Automatically generated VHDL-2002
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.all;
use work.Solver_types.all;

entity compute_main is
  port(keys_input        : in std_logic_vector(3 downto 0);
       switches_input    : in std_logic_vector(3 downto 0);
       control_write     : in std_logic_vector(0 downto 0);
       control_writedata : in std_logic_vector(31 downto 0);
       control_address   : in std_logic_vector(7 downto 0);
       control_read      : in std_logic_vector(0 downto 0);
       in_write          : in std_logic_vector(0 downto 0);
       in_writedata      : in std_logic_vector(31 downto 0);
       in_address        : in std_logic_vector(7 downto 0);
       out_address       : in std_logic_vector(7 downto 0);
       out_read          : in std_logic_vector(0 downto 0);
       clock             : in std_logic_vector(0 downto 0);
       reset             : in std_logic_vector(0 downto 0);
       leds_status       : out std_logic_vector(3 downto 0);
       control_readdata  : out std_logic_vector(31 downto 0);
       out_readdata      : out std_logic_vector(31 downto 0));
end;

architecture structural of compute_main is
  signal system1000      : std_logic;
  signal system1000_rstn : std_logic;
  signal pll_locked      : std_logic;
  signal input_0         : product0;
  signal output_0        : product1;
begin
  pll_inst : entity pll
    port map
      (refclk   => clock(0)
      ,outclk_0 => system1000
      ,rst      => not reset(0)
      ,locked   => pll_locked);
  
  -- reset system1000_rstn is asynchronously asserted, but synchronously de-asserted
  resetSync_n_0 : block
    signal n_1 : std_logic;
    signal n_2 : std_logic;
  begin
    process(system1000,pll_locked)
    begin
      if pll_locked = '0' then
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
             ,product0_sel1 => switches_input
             ,product0_sel2 => control_write
             ,product0_sel3 => control_writedata
             ,product0_sel4 => control_address
             ,product0_sel5 => control_read
             ,product0_sel6 => in_write
             ,product0_sel7 => in_writedata
             ,product0_sel8 => in_address
             ,product0_sel9 => out_address
             ,product0_sel10 => out_read);
  
  Solver_topEntity_0_inst : entity Solver_topEntity_0
    port map
      (w3_i1           => input_0
      ,system1000      => system1000
      ,system1000_rstn => system1000_rstn
      ,topLet_o        => output_0);
  
  leds_status <= output_0.product1_sel0;
  
  control_readdata <= output_0.product1_sel1;
  
  out_readdata <= output_0.product1_sel2;
end;
