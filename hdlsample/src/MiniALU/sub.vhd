-------------------------------------------------------------------------------
--
-- Title       : AND8
-- Design      : Runtime
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : AND8.vhd
-- Generated   : Thu Nov 14 09:28:49 2013
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {AND8} architecture {AND8}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;	
use IEEE.STD_LOGIC_UNSIGNED.all;

entity SUB8 is
	 port(
		 A : in STD_LOGIC_VECTOR(7 downto 0);
		 B : in STD_LOGIC_VECTOR(7 downto 0);
		 O : out STD_LOGIC_VECTOR(7 downto 0)
	     );
end SUB8;

--}} End of automatically maintained section

architecture dataflow of SUB8 is
begin

	O <= A - B;   
	
end dataflow;
