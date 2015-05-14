-- receive_write.vhd

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

entity receive_write is
	port (
		clk       : in std_logic                      := '0';             --        clock.clk
		write     : in std_logic                      := '0';             -- avalon_slave.write
		writedata : in std_logic_vector(127 downto 0) := (others => '0'); --             .writedata
		rst       : in std_logic                      := '0'              --        reset.reset
	);
end entity receive_write;

architecture rtl of receive_write is
begin

	-- TODO: Auto-generated HDL template

end architecture rtl; -- of receive_write
