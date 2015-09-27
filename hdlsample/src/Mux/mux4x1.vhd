--------------------------------------------------------------------------------
--
-- Design unit generated by Aldec IP Core Generator, version 9.1.
-- Copyright (c) 1997 - 2011 by Aldec, Inc. All rights reserved.
--
--------------------------------------------------------------------------------
--
-- Created on Thursday 2013-11-14, 9:24:23
--
--------------------------------------------------------------------------------
-- Details:
--		Type: Multiplexer
--		Code style: Case statement
--		Inputs and output width: 8
--		Number of inputs: 4
--		Defalut output bits value '0'
--------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {mux4x1} architecture {mux_arch}}

library IEEE;
use IEEE.std_logic_1164.all;

entity mux4x1 is
	port (
		I0 : in std_logic_vector(7 downto 0);
		I1 : in std_logic_vector(7 downto 0);
		I2 : in std_logic_vector(7 downto 0);
		I3 : in std_logic_vector(7 downto 0);
		S : in std_logic_vector(1 downto 0);
		O : out std_logic_vector(7 downto 0)
	);
end entity;

--}} End of automatically maintained section

library IEEE;
use IEEE.std_logic_unsigned.all;

architecture mux_arch of mux4x1 is
begin

	process (S, I0, I1, I2, I3)
	begin
		case S is
			when "00" => O <= I0;
			when "01" => O <= I1;
			when "10" => O <= I2;
			when "11" => O <= I3;
			when others => NULL;
		end case;
	end process;

end architecture;
