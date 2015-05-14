-- transmit_write.vhd

-- This file was auto-generated as a prototype implementation of a module
-- created in component editor.  It ties off all outputs to ground and
-- ignores all inputs.  It needs to be edited to make it do something
-- useful.
-- 
-- This file will not be automatically regenerated.  You should check it in
-- to your version control system if you want to keep it.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity transmit_write is
	port (
		clk         : in  std_logic                      := '0'; --         clock.clk
		write       : out std_logic;                             -- avalon_master.write
		writedata   : out std_logic_vector(127 downto 0);        --              .writedata
		waitrequest : in  std_logic                      := '0'; --              .waitrequest
		rst         : in  std_logic                      := '0'  --         reset.reset
	);
end entity transmit_write;

architecture rtl of transmit_write is
begin

	-- TODO: Auto-generated HDL template

	write <= '0';

	writedata <= "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

end architecture rtl; -- of transmit_write
