-------------------------------------------------------------------------------
--
-- Title       : dualportram
-- Design      : Traffice_Lamp
-- Author      : Windows User
-- Company     : DCE, SOICT,HUST
--
-------------------------------------------------------------------------------
--
-- File        : dualportram.vhd
-- Generated   : Thu Dec 18 15:46:25 2014
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {dualportram} architecture {dualportram}}

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all; 
USE ieee.std_logic_arith.all; 
use ieee.numeric_std.all;

entity dualportram is
	 port(
		 clkA : in STD_LOGIC;		                   -- Xung nhip ghi voi wr_en, addrA, data_in
		 clkB : in STD_LOGIC;						   -- Xung nhip doc voi addrB, data_out
		 wr_en : in STD_LOGIC;		 
		 addrA : in std_logic_vector(9 downto 0);
		 addrB : in std_logic_vector(9 downto 0);	
		 data_in : in std_logic_vector(7 downto 0);
		 data_out : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end dualportram;

architecture dualportram of dualportram is
type ram_t is array(0 to 1023) of std_logic_vector(7 downto 0); 
shared variable ram : ram_t;
begin
process (clkA)
begin
	if clkA'event and clkA = '1' then
		if wr_en = '1' then
			ram(conv_integer(addrA)) := data_in;
		end if;
	end if;
end process;

process (clkB)
begin
	if clkB'event and clkB = '1' then
		data_out <= ram(conv_integer(addrB));
	end if;
end process;
end dualportram;
